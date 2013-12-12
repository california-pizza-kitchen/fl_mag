class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by(:slug => params[:slug])
    @blogger = Blogger.find_by(:slug => params[:blogger_slug])
  end

  def publish
    @entry = Entry.find_by(:slug => params[:slug])
    @entry.update(:added? => true, :mag_published => Time.now)
    redirect_to '/users/1'
  end

  def tag
    entry_tag = EntriesTag.find_by(:entry_id => params[:entry_id], :tag_id => params[:tag_id])
    entry_tag.update(:visible => true)
    redirect_to '/users/1'
  end

end