class Feed < ActiveRecord::Base
  belongs_to :blogger

  def self.fetch(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed.sanitize_entries!
  end
    
  private
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :blogger      => user.id,
          :name         => entry.title,
          :summary      => entry.summary,
          :content      => entry.content,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.id
        )
      end
    end
  end
end