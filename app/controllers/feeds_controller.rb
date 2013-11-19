class FeedsController < ApplicationController

  
  def index
    @feeds = Feed.all
  end

  def create
    new_feed = Feed.fetch
  end

  def update_all
    Blogger.all.each do |blogger|
      feed = blogger.feed
      feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_url) 
      feed.add_entries(feedzirra_object.entries)
    end 
  end

  def update
    @blogger = Blogger.find_by(:id => params[:user_id])
    feed = @blogger.feed 
    feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_url)   
    updated_feed = Feedzirra::Feed.update(feedzirra_object)

    updated_feed.new_entries if updated_feed.updated?     
  end

end