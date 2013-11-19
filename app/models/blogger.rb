class Blogger < ActiveRecord::Base
  has_one :feed
  has_many :entries, through: :feed

  def find_most_recent
    self.entries.sort_by{|entry| entry.published}.reverse.first
  end

  def self.get_new_posts
    self.all.each do |blogger|
      most_recent_blog_date = blogger.find_most_recent.published
      feedzirra_object = Feedzirra::Feed.fetch_and_parse(blogger.feed.feed_url) 
      new_posts = feedzirra_object.entries.select do |entry|
        entry if entry.published > most_recent_blog_date
      end
      blogger.feed.add_entries(new_posts) if new_posts != []
    end
  end
end

# pagination