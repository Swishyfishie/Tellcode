class UsersController < ApplicationController
    def new
        @user = User.new
    end
  
    def create
        @user = User.find_or_create_by(username: user_params[:username])
      
        if @user.valid?
            user_login(@user)
        elsif !@user.valid?
            flash[:error] = 'Wrong credentials'
            redirect_to login_path   
        else
            user_create(@user)
        end
    end

    private 
  
    def user_login(user)
        if user.try(:authenticate, user_params[:password])
            session[:user_id] = user.id
            flash[:success] = "Welcome back #{user.username}"
            redirect_to root_path
        else
            flash[:error] = 'Wrong credentials'
            redirect_to login_path
        end
    end
    
    
    def user_create(user)
        if user_params[:password] == user_params[:password_confirmation]
            user.password = user_params[:password]
            user.save
            flash[:success] = 'Welcome To 100DaysOfCode'
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:error] = "try again or Login with Github"
            redirect_to signup_path
        end
    end

    def user_params
        params.require(:user).permit(:username,:password, :password_confirmation)
    end


end
