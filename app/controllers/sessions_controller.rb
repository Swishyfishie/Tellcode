class SessionsController < ApplicationController
  def new
  end

  def create
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
