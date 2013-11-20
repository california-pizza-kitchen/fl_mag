class UsersController < ApplicationController

  def show
    @user = User.first
    @blogger = Blogger.new
    @bloggers = Blogger.all
    @entries = Entry.sort_by_date_published
  end


end
