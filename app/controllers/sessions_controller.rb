class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])&.authenticate(params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash[:alert] = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
