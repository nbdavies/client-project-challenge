class ArticlesController < ApplicationController
  def index
    @articles = Article.select do |article|
      article.published_version
    end
    @articles.sort_by! do |article|
     - article.published_version.id 
    end
  end

  def search
    @articles = Article.search(params[:q])
  end

  def new
    @article = Article.new
    @article.versions.build
  end

  def create
    @article = Article.new(title: article_params, author_id:current_user.id)
    if @article.save
      redirect_to new_article_version_path(@article.id)
    else
      render 'new'
    end
  end


  def show
    @article = Article.find(params[:id])
    @version = @article.published_version
    @categories = @version.categories
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, versions_attributes: [:content, :image_url, :image_caption, :draft])
  end
end
