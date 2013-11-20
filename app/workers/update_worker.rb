class UpdateWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    Blogger.all.each do |blogger|
      most_recent_blog_date = blogger.most_recent_entry.published
      feedzirra_object = Feedzirra::Feed.fetch_and_parse(blogger.feed.feed_xml) 
      new_posts = feedzirra_object.entries.select do |entry|
        entry if entry.published > most_recent_blog_date.to_time.utc
      end
      blogger.feed.add_entries(new_posts) if new_posts != []
    end
  end

end