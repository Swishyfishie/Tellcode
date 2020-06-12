class SessionsController < ApplicationController
  
  def new
  end

  def create
    
    request.env['omniauth.auth']
    session[:name] = request.env['omniauth.auth']['info']['name']
    session[:omniauth_data] = request.env['omniauth.auth']
    
    redirect_to root_path

  end

  def login
  end

  def welcome
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
