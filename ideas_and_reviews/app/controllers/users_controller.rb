class UsersController < ApplicationController
  before_action :find_user

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing in, #{@user.first_name}!"
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find params[:id] if params[:id].present?
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
