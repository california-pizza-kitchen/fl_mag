class EntriesController < ApplicationController
  before_action :login_required, except: [:show]
  def show
    @entry = Entry.find_by(:slug => params[:slug])
    @blogger = Blogger.find_by(:slug => params[:blogger_slug])
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @entry.to_json }
    # end
  end

  def publish
    @entry = Entry.find_by(:slug => params[:slug])
    @entry.publish
    redirect_to '/users/1'
  end

  def unpublish
    @entry = Entry.find_by(:slug => params[:slug])
    @entry.unpublish
    redirect_to '/users/1'
  end

  def tag
    @entry_tag = EntriesTag.find_by(:entry_id => params[:entry_id], :tag_id => params[:tag_id])
    @entry_tag.update(:visible => true)
    redirect_to '/users/1'
  end

  def untag
    @entry_tag = EntriesTag.find_by(:entry_id => params[:entry_id], :tag_id => params[:tag_id])
    @entry_tag.update(:visible => false)
    redirect_to '/users/1'
  end
end