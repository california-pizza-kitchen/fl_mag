# require 'will_paginate'
class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :login_required#, except: [:new, :create]

  def show
    @user = User.first
    @blogger = Blogger.new
    @tag = Tag.new
    @bloggers = Blogger.all
    @entries = Entry.page(params[:page]).per_page(10).order('published DESC')
  end

  def index
    @user = User.first
    @blogger = Blogger.new
    @bloggers = Blogger.all
    @entries = Entry.featured_by_date_published[0..19]
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

  def tags
    @tags = Tag.alphabetized
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:name, :email, :twitter_handle, :password, :password_confirmation)
  end

end
