class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit,:update, :destroy]

  def show
    @user = User.first
    @blogger = Blogger.new
    @bloggers = Blogger.all
    @entries = Entry.sort_by_date_published
  end

  def new
  end

  def create
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save 
    redirect_to "user/#{user.id}"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:name, :email,:password, :password_confirmation)
  end

end
