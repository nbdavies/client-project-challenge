class VersionsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @versions = @article.versions.reverse
  end

  def new
    @article = Article.find(params[:article_id])
    @version = @article.published_version
    @version = @article.versions.new if !@version
    @categories = Category.all
  end

  def create
    redirect_to sessions_new unless current_user
    @version = current_user.versions.new(article_id: params[:article_id], content: version_params[:content], image_url: version_params[:image_url], image_caption: version_params[:image_caption], draft: version_params[:draft])

    categories = version_params[:category_ids] - [""]
    @version.categories = categories.map do |id|
      Category.find(id)
    end
    if @version.save
      if @version.draft != true
        @version.update_attributes(published: true)
        redirect_to article_path(params[:article_id])
      else
        redirect_to user_path(current_user.id)
      end
    else
      render 'new'
    end
  end

  def update
    create
  end

  def show
    @article = Article.find(params[:article_id])
    @version = Version.find(params[:id])
    @categories = @version.categories
    if @version != nil
      @categories = @version.categories
    else
      redirect_to root_path
    end
    @content = content_to_html(@version.content)
  end

  def edit
    @article = Article.find(params[:article_id])
    @version = Version.find_by(article_id: params[:article_id], id: params[:id])

  end

  private

  def version_params
    params.require(:version).permit(:content, :image_url, :image_caption, :draft, :category_ids => [])
  end

end
