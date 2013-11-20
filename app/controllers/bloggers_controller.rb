class BloggersController < ApplicationController

  def create
    blogger = Blogger.create(blogger_params)

    # begin

      feedzirra_object = Feedzirra::Feed.fetch_and_parse(params[:blogger][:feed_xml])
      feedzirra_object.sanitize_entries! 

      blogger.update(:feed_xml => params[:blogger][:feed_xml])
      blogger.build_feed(:feed_xml => params[:blogger][:feed_xml])
      feed = blogger.feed

      # feed.add_entries(feedzirra_object.entries)
      UpdateWorker.perform_async

      blogger.feed.save
    # rescue
    #   blogger.update(:feed_xml => "No XML for blog!")
    # end

    redirect_to '/users/show'
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester)
  end
end