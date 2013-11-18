class BloggersController < ApplicationController


  def create
    blogger = Blogger.create(blogger_params)
    # add_blogger_to_parser(blogger)
  end



  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :xml_address)
  end
end