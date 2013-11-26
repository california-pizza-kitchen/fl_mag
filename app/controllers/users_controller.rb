class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :login_required#, except: [:new, :create]

  def show
    @user = User.first
    @blogger = Blogger.new
    @bloggers = Blogger.all
    @entries = Entry.sort_by_date_published(Entry.all)
  end

  def new
  end

  def create
    user = User.new
    user.name                  = params[:name]
    user.email                 = params[:email]
    user.password              = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save 
      login(user.id)
      redirect_to '/users/dashboard'
    else
      redirect_to '/register'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:name, :email, :twitter_handle, :password, :password_confirmation)
  end

end
