class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles.each do |article|
      article.versions.select {|version| version.published == true}
    end
    # versions.find_by(published: true)
    # @articles.select |article|
    # @articles.select do |article|
    #   article.published_version
    # end
    # puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    # puts @articles

    # @articles = Article.select do |article|
    #   article.published_version
    # end
    # @articles.sort_by! do |article|
    #  - article.published_version.id
    # end
  end

  def search
    @articles = Article.search(params[:q])
  end

  def new
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
    @categories = @version.categories
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end
end
