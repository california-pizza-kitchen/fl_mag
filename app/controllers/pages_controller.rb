class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = User.first
    @blogger = Blogger.new
  end

end
