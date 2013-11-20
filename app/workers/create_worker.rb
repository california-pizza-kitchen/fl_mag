class CreateWorker
  include Sidekiq::Worker


  def perform(blogger_id)
    blogger = Blogger.find(blogger_id)
    feedzirra_object = Feedzirra::Feed.fetch_and_parse(blogger.feed_xml)
    feedzirra_object.sanitize_entries! 
    blogger.build_feed(:feed_xml => blogger.feed_xml)
    blogger.feed.save
    blogger.feed.add_entries(feedzirra_object.entries)
  end

end