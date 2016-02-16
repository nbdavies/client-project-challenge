class VersionsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @versions = @article.versions.reverse
  end

  def new
    @article = Article.find(params[:article_id])
    @version = @article.versions.new
  end

  def create

  end

  private

  def version_params
    params.require(:version).permit(:content, :image_url, :image_caption, :draft)
  end

end
