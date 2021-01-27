class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
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
    redirect_to bars_saved_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
