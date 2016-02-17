class ArticlesController < ApplicationController
  def index
    @articles = Article.published
    @articles.each do |article|
      article.versions.select {|version| version.published == true}
    end
  end

  def search
    @articles = Article.search(params[:q])
  end

  def new
    redirect_to sessions_new_path unless current_user
    @article = Article.new
  end

  def create
    redirect_to sessions_new_path unless current_user
    @article = current_user.articles.new(article_params)
    if @article.save
        redirect_to new_article_version_path(@article.id)
    else
      render 'new'
    end
  end


  def show
    @article = Article.find(params[:id])
    @version = @article.published_version
    if @version != nil
      @categories = @version.categories
    else
      redirect_to root_path
    end
    @content = content_to_html(@version.content)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def flag
    @article = Article.find(params[:id])
    @article.update(flagged: true)
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :flagged)
  end
end
