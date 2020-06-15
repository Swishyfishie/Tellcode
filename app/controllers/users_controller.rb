class UsersController < ApplicationController
    def new
        @user = User.new
    end
  
    def create
        @user = User.find_by(username: user_params[:username])
        
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Logged in!"
        else 
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Signed up and logged in!"
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username,:password, :password_confirmation)
    end
end
