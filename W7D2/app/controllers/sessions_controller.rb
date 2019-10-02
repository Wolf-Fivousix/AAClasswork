class SessionsController < ApplicationController
  
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      #reset user's session token and make session cookie equal to it
      log_in!(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    current_user.reset_session_token!
    render :new
  end
end