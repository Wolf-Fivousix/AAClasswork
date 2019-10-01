class UsersController < ApplicationController
  before_action :validate_user

  def new
    # @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login_user!
      # redirect_to cats_url
    else
      render json: "Invalid User", status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
