class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:welcome, :new, :github_create, :create]


  def new
    @user = User.new
  end

  def create
    # add user login here from the users_controller
    # user = User.find_by(user_params)
    #   if user.try(:authenticate, user_params[:password])
    #     session[:user_id] = user.id
    #     flash[:success] = "Welcome back #{user.username}"
    #     redirect_to root_path
    #   else
    #     flash[:error] = 'Wrong credentials'
    #     redirect_to login_path
    #   end
    @user = User.find_by(username: params[:username])   
    if @user && @user.authenticate(params[:password])      
      session[:user_id] = @user.id      
      redirect_to root_path   
    else      
      redirect_to login_path  
    end
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
  
    def user_login(user)

    end

  def user_params
    params.require(:user).permit(:username,:password)
  end

  def auth
    request.env['omniauth.auth']
  end
  
end
