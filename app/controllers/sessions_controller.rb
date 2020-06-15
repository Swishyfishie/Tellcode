class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:welcome, :new]


  def new
    @user = User.new
  end

  def create

  end

  def github_create
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.username}!"
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private 

  def auth
    request.env['omniauth.auth']
  end
  
end
