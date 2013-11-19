class Feed < ActiveRecord::Base
  belongs_to :blogger
  has_many :entries

  def self.fetch(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed.sanitize_entries!
  end
  
  def add_entries(entries)
    entries.each do |entry|
      @entry = self.entries.build(
        :title        => entry.title,
        :url          => entry.url,
        :summary      => entry.summary,
        :content      => entry.content,
        :url          => entry.url,
        :published    => entry.published
      )
      @entry.save
    end
  end

  def self.sort_by_date_published
    self.all.sort_by{|entry| entry.published}.reverse
  end

end

    # t.string  "title"
    # t.string  "url"
    # t.string  "author"
    # t.text    "summary"
    # t.text    "content"
    # t.time    "published"
    # t.integer "feed_id"