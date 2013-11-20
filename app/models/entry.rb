class Entry < ActiveRecord::Base
  belongs_to :feed
  belongs_to :blogger

  def author_name
    self.feed.blogger.name
  end

  def author_id
    self.feed.blogger.id
  end

  def summarize
    # binding.pry
    if self.content.include?("<p>")
      first = self.content.split("<p>")[1]
      second = self.content.split("<p>")[2]
      first + second
    else
      self.content
    end
    # binding.pry
  end

  def self.sort_by_date_published
    self.all.sort_by{|entry| entry.published}.reverse
  end
end