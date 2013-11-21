class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find_by(:slug => params[:slug])
  end


  def create
    # @user = User.first
    # @blogger = Blogger.new
    # @bloggers = Blogger.all
    # @entries = Entry.sort_by_date_published(Entry.all)

    blogger = Blogger.create(blogger_params)
    CreateWorker.perform_async(blogger.id)
    if blogger.save
      redirect_to '/users/show', notice: "Success!"
    else
      redirect_to '/users/dashboard', alert: "No success!", errors: blogger.errors.full_messages.to_sentence
    end
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :id, :feed_xml)
  end
end