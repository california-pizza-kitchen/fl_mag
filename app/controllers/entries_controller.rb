class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by(:id => params[:id])
    @blogger = Blogger.find_by(:id => params[:blogger_id])
  end
end