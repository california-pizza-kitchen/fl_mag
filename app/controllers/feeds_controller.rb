class FeedsController < ApplicationController

  
  def index
    @entries = Entry.sort_by_date_published
  end

  def create
    new_feed = Feed.fetch
  end

  def update_all
    Blogger.get_new_posts
  end

  def show
    @entry = Entry.find_by(:id => params[:id])
  end

end