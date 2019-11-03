class Api::SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      sign_in(user)
      render json: user
    else
      render json: "Invalid credentials", status: 404
    end
  end

  def destroy
    if !signed_in?
      render json: {}, status: 404
    else
      sign_out
    end
  end
end
