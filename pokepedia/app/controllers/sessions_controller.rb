 class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

   def delete
      session.destroy
      redirect_to root_path
    end

    private
    def session_params
      params.require(:session).permit(:username, :password)
    end
end
