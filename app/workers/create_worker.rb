class CreateWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false


  def perform(blogger_id)
    blogger = Blogger.find(blogger_id)
    blogger.build_feed(:feed_xml => blogger.feed_xml)
    feedzirra_object = Feedzirra::Feed.fetch_and_parse(blogger.feed_xml)
    feedzirra_object.sanitize_entries! 
    blogger.feed.save
    blogger.feed.add_entries(feedzirra_object.entries)
  end

end