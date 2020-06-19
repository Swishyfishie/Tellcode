class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new ,:create]

    def new
        @user = User.new
    end

    def index
        @users = User.all
        @day = params[:day_id].to_i
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        # byebug
        redirect_to user_path(@user)
    end

    def create
        @user = User.find_or_create_by(username: user_params[:username])
        if @user.valid?
            flash[:error] = "Try to log in"
            redirect_to login_path
        elsif !@user.valid? && @user.username && (@user.password == @user.password_confirmation)
            user_create(@user)
        else
            flash[:error] = 'Wrong credentials'
            redirect_to login_path   
        end
    end

    def destroy
        if current_user.cards != []
            current_user.cards.each do |card|
                card.destroy
            end
        end
        current_user.destroy
        session.destroy
        redirect_to root_path
    end

    private 
  
    def user_login(user)
        if user.try(:authenticate, user_params[:password])
            session[:user_id] = user.id
            flash[:success] = "Welcome back #{user.username}"
            redirect_to user_path(user)
        else
            flash[:error] = 'Wrong credentials'
            redirect_to login_path
        end
    end
    
    
    def user_create(user)
        if user_params[:password] == user_params[:password_confirmation]
            user.password = user_params[:password]
            user.about_me = user_params[:about_me]
            user.save
            flash[:success] = "Welcome To 100DaysOfCode #{user}"
            session[:user_id] = user.id

            redirect_to user_path(user)
        else
            flash[:error] = "Try again or Login with Github"
            redirect_to signup_path
        end
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :about_me)
    end


end
