class UsersController < ApplicationController
  
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      log_in!(@user)
      redirect_to users_url
    else
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end