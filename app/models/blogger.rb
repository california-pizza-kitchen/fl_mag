class Blogger < ActiveRecord::Base
  has_one :feed
  has_many :entries, through: :feed

  def most_recent_entry
    self.entries.most_recent
    # self.entries.sort_by{|entry| entry.published}.reverse.first
  end

  def url
    self.feed_xml[0..-9]
  end

end