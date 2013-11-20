class Entry < ActiveRecord::Base
  belongs_to :feed
  belongs_to :blogger

  def self.most_recent
    order("published DESC").limit(1).first
  end
  
  def author_name
    self.feed.blogger.name
  end

  def author_id
    self.feed.blogger.id
  end

  def summarize
    if self.content.include?("<p>")
      first = self.content.split("<p>")[1]
      second = self.content.split("<p>")[2]
      first + second if first && second
    else
      self.content
    end
  end

  def self.sort_by_date_published(collection)
    collection.sort_by{|entry| entry.published}.reverse
  end

  def self.featured_entries
    self.where(:added? => true)
  end

end