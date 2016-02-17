class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to sessions_new unless current_user.id == @user.id
    @articles = Article.where(author_id: @user.id)
    # [article1, article2]
    @versions = @articles.map do |article|
               article.versions # [article1.version1, article1.version2]
             end
   @versions.flatten!
    # [[article1.version1, article1.version2], [article2.version1]]
    @drafts = @versions.select do |version|
              version.draft == true

            end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
