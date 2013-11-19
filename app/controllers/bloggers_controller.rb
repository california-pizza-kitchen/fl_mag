class BloggersController < ApplicationController


  def create
    blogger = Blogger.create(blogger_params)
    blogger.build_feed(:feed_xml => params[:blogger][:xml_address])
    feed = blogger.feed
    feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
    feed.add_entries(feedzirra_object.entries)
    blogger.feed.save
    redirect_to '/'
  end



  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester)
  end
end