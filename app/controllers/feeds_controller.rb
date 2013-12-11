class FeedsController < ApplicationController
  
  def index
    @entries = Entry.featured_by_date_published[0..19]
  end

  def index_by_tag
    @tag = Tag.find_by(:slug => params[:tag_slug])
    @entries = Entry.collect_by_tag(@tag.id)
    @all_entries = Entry.featured_entries.shuffle[0..19]
  end

  def create
    new_feed = Feed.fetch
  end

  def show
    @entry = Entry.find_by(:slug => params[:slug])
  end

end