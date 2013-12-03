class FeedsController < ApplicationController
  
  def index
    @entries = Entry.sort_by_date_published(Entry.featured_entries)[0..19]
  end

  def index_by_tag
    @tag = Tag.find_by(:slug => params[:tag_slug])
    @entries = Entry.collect_by_tag(@tag.id).flatten
    @all_entries = Entry.featured_entries.shuffle[0..19]
  end

  def create
    new_feed = Feed.fetch
  end

  def show
    @entry = Entry.find_by(:slug => params[:slug])
  end

end