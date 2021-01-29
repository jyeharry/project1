class UsersController < ApplicationController
  before_action :check_for_login, :only => [:index, :show, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @button = "Sign up" # to replace the button text in the form
    flash[:error_taken_email] = '' # clear any recent errors
  end

  def show
    @user = User.find params[:id]
    @bars = @user.bars.order updated_at: :desc
  end

  def edit
    redirect_to root_path if is_wrong_user?
    @user = User.find params[:id]
    @button = "Save changes" # to replace the button text in the form
  end

  def update
    user = User.find params[:id]
    if user.update user_params # if successful, go to user profile
      redirect_to user_path user.id
    else # if unsuccessful then either the email was taken or passwords did not match
      flash[:error_taken_email] = 'Email is taken or passwords did not match'
      redirect_to edit_user_path(params[:id])
    end
  end

  def create
    @user = User.new user_params
    if @user.save # if successful, go to homepage
      session[:user_id] = @user.id
      redirect_to root_path
    else # if unsuccessful then either the email was taken or passwords did not match
      flash[:error_taken_email] = 'Email is taken or passwords did not match'
      render :new
    end
  end

  def save
    bar = Bar.find params[:bar_id]
    bar.touch # updates the "updated_at" column so most recently saved entry appears last
    @current_user.bars << bar
    redirect_back :fallback_location => 'post'
  end

  def unsave
    @current_user.bars.delete Bar.find(params[:bar_id])
    redirect_back :fallback_location => 'post'
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def is_wrong_user?
    @current_user.id != params[:id].to_i
  end
end
