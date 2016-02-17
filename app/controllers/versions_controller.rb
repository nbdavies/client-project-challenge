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
    redirect_to sessions_new unless current_user
    @version = current_user.versions.new(article_id: params[:article_id], content: version_params[:content], image_url: version_params[:image_url], image_caption: version_params[:image_caption], draft: version_params[:draft])
    if @version.save
      if @version.draft == 0
        @version.update_attributes(published: true)
        redirect_to article_path(params[:article_id])
      else
        redirect_to user_path(current_user.id)
      end
    else
      render 'new'
    end
  end

  private

  def version_params
    params.require(:version).permit(:content, :image_url, :image_caption, :draft)
  end

end
