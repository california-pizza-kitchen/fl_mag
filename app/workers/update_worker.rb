class UpdateWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    Blogger.all.each do |blogger|

      # ACTUAL UPDATE CODE 
      most_recent_blog_date = blogger.find_most_recent.published
      feedzirra_object = Feedzirra::Feed.fetch_and_parse(blogger.feed.feed_url) 
      new_posts = feedzirra_object.entries.select do |entry|
        entry if entry.published > most_recent_blog_date
      end
      blogger.feed.add_entries(new_posts) if new_posts != []

      # SPECED OUT CODE
      # entry = blogger.feed.entries.build(:title => "TESTING SIDETIQ and SIDEKIQ")
      # entry.save

    end
  end

end