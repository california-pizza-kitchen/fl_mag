class FeedsController < ApplicationController

  def new
  end

  def create
    new_feed = Feed.fetch
  end

  def update
    @blogger = Blogger.find_by(:id => params[:user_id])
    feed = Feed.find_by(:user_id = params[:user_id])
    
    updated_feed = Feedzirra::Feed.update(feed)
    updated_feed.new_entries if updated_feed.updated?     
  end

end