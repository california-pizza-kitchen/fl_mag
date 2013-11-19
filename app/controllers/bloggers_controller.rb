class BloggersController < ApplicationController

  def create
    blogger = Blogger.create(blogger_params)
    blogger.build_feed(:feed_xml => params[:blogger][:feed_xml])
    feed = blogger.feed
    feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
    feed.sanitize_entries! 
    feed.add_entries(feedzirra_object.entries)
    blogger.feed.save
    redirect_to '/users/show'
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :feed_xml)
  end
end