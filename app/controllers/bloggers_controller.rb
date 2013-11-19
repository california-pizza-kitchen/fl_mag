class BloggersController < ApplicationController


  def create
    blogger = Blogger.create(blogger_params)
    blogger.build_feed(params[:blogger][:feed_xml])
  end



  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :xml_address)
  end
end