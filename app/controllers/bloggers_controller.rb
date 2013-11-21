class BloggersController < ApplicationController
  respond_to :html

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find_by(:slug => params[:slug])
  end


  def create
    blogger = Blogger.create(blogger_params)
    CreateWorker.perform_async(blogger.id)
    respond_to do |format|
      if blogger.save
        format.html {redirect_to '/users/show', notice: "Success!"}
      else
        format.html {redirect_to'/users/show', notice: blogger.errors.full_messages}
      end
    end
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :id, :feed_xml)
  end
end















