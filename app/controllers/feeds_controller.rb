class FeedsController < ApplicationController
  
  def index
    @entries = Entry.sort_by_date_published(Entry.featured_entries)
  end

  def index_by_tag
    @tag = Tag.find_by(:slug => params[:tag_slug])
    @entries = Entry.collect_by_tag(@tag.id).flatten
  end

  def create
    new_feed = Feed.fetch
  end

  def show
    @entry = Entry.find_by(:slug => params[:slug])
  end

end