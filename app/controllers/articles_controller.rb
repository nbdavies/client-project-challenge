class ArticlesController < ApplicationController
  def index
    @articles = Article.all.sort_by{ |article| - article.published_version.id }
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
end
