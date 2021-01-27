class UsersController < ApplicationController
  before_action :check_for_login, :only => [:index, :show, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to root_path
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def save
    bar = Bar.find params[:bar_id]
    @current_user.bars << bar
    redirect_back :fallback_location => 'post'
  end

  def unsave
    @current_user.bars.delete Bar.find(params[:bar_id])
    redirect_back :fallback_location => 'post'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
