class UsersController < ApplicationController

  def show
    @user = User.first
    @blogger = Blogger.new
    @bloggers = Blogger.all
  end


end