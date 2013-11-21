class Feed < ActiveRecord::Base
  belongs_to :blogger
  has_many :entries

  def self.fetch(feed_xml)
    feed = Feedzirra::Feed.fetch_and_parse(feed_xml)
    feed.sanitize_entries!
  end
  
  def add_entries(entries)
    entries.each do |entry|
      entry = self.entries.build(
        :title        => entry.title,
        :url          => entry.url,
        :content      => entry.content,
        :url          => entry.url,
        :published    => entry.published,
        :author       => self.blogger
      )
      entry.save
    end
  end

end