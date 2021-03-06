class SessionsController < ApplicationController
  before_action :validate_user, only: [:new, :create]

  def new
    render :new
  end

  def create
    login_user!
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
