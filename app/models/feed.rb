class Feed < ActiveRecord::Base
  belongs_to :blogger
  has_many :entries

  def self.fetch(feed_xml)
    feed = Feedzirra::Feed.fetch_and_parse(feed_xml)
    feed.sanitize_entries!
  end
  
  def add_entries(rss_entries)
    rss_entries.each do |rss_entry|
      entry = self.entries.build(
        :title        => rss_entry.title,
        :url          => rss_entry.url,
        :published    => rss_entry.published,
        :author       => self.blogger
      )
      if rss_entry.respond_to?(:content) && entry.content != nil
        entry.content = rss_entry.content
      elsif rss_entry.respond_to?(:summary)
        entry.content = rss_entry.summary
      end
      entry.save
    end
  end

end