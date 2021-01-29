class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password]) # if sign in details are correct, then go to homepage
      session[:user_id] = user.id
      redirect_to root_path
    else # if incorrect refresh page and display error
      flash[:error_invalid_email_password] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
