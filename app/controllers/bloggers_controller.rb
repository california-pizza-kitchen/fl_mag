class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find_by(:id => params[:id])
  end


  def create
    blogger = Blogger.create(blogger_params)
    CreateWorker.perform_async(blogger.id)
    redirect_to '/users/show'
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :id, :feed_xml)
  end
end