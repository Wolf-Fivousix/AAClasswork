class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :login_user!, :validate_user

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_url
    else
      render json: ["No bueno on username and/or password!"]
    end
  end

  def validate_user
    if logged_in?
      redirect_to cats_url
    end
  end
end
