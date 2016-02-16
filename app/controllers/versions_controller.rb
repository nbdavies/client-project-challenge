class VersionsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @versions = @article.versions.reverse
  end
end
