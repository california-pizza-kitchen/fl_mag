class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by(:id => params[:id])
    @blogger = Blogger.find_by(:id => params[:blogger_id])
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(:added? => true)
    redirect_to '/users/1'
  end
end