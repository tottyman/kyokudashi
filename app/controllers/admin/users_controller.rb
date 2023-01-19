class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @members = Member.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :introduction, :image)
  end
  
end
