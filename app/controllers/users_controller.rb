class UsersController < ApplicationController
    def new
        @user = User.new
    end
  
    def create
        user = User.find_by(username: user_params[:username])
    byebug
        if user && user.authenticate(user_params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in!"
        else 
            flash.now[:alert] = "Wrong credentials. Try again!"
            render "new"
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username,:password)
    end
end
