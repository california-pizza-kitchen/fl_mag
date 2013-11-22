class EntriesController < ApplicationController

  def show
    # binding.pry
    @entry = Entry.find_by(:slug => params[:slug])
    @blogger = Blogger.find_by(:slug => params[:blogger_slug])
  end

  def publish
    @entry = Entry.find_by(:slug => params[:slug])
    @entry.update(:added? => true)
    redirect_to '/users/1'
  end
end