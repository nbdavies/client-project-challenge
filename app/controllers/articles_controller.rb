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
