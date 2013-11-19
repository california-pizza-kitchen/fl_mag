class Entry < ActiveRecord::Base
  belongs_to :feed
  belongs_to :blogger

  def author_name
    self.feed.blogger.name
  end

  def summarize
    self.feed.content.slice
  end

  def self.sort_by_date_published
    self.all.sort_by{|entry| entry.published}.reverse
  end
end