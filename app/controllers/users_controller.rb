# require 'will_paginate'
class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :login_required#, except: [:new, :create]

  def index
    @user = User.first
    @blogger = Blogger.new
    @bloggers = Blogger.all
    @entries = Entry.featured_by_date_published[0..19]
  end

  def show
    @user = User.first
    @blogger = Blogger.new
    @tag = Tag.new
    @school_session = SchoolSession.new
    @school_sessions = SchoolSession.all
    @bloggers = Blogger.all
    @entries = Entry.page(params[:page]).per_page(10).order('published DESC')
  end

  def admin_session_view
    @user = User.first
    if params[:school_session_slug] == "all"
      @entries = Entry.page(params[:page]).per_page(10).order('published DESC')
      @title_string = "All"
    elsif params[:school_session_slug] == "unassigned"
      @entries = Entry.collect_unassigned.page(params[:page]).per_page(10).order('published DESC')
      @title_string = "Unassigned"
    else
      @school_session = SchoolSession.find_by(:slug => params[:school_session_slug])
      @title_string = @school_session.name
      @entries = Entry.collect_by_school_session(@school_session.id).page(params[:page]).per_page(10).order('published DESC')
    end
  end

  def admin_blog_view
    @user = User.first
    @entry = Entry.find_by(:slug => params[:entry_slug])
    @blogger = @entry.feed.blogger
  end

  def admin_blogger_view
    @user = User.first
    @blogger = Blogger.find_by(:slug => params[:blogger_slug])
    @entries = Entry.where(:author => @blogger.id).page(params[:page]).per_page(10).order('published ASC')
  end

  def admin_tag_view
    @user = User.first
    @tag = Tag.find_by(:slug => params[:tag_slug])
    @entries = Entry.collect_by_tag(@tag.id).page(params[:page]).per_page(10).order('published ASC')
  end

  def admin_mainpage_view
    @user = User.first
    @entries = Entry.featured_by_date_published.page(params[:page]).per_page(10).order('mag_published ASC')
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
