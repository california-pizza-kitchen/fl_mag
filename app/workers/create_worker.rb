class CreateWorker
  require 'open-uri'
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def xml_path(blogger)
    path = blogger.feed_url
    page = Nokogiri::HTML(open(path))
    atom_path = page.css('link[rel=alternate]').attr("href").value

    atom_path.include?(path) ? xml_path = atom_path : xml_path = path + atom_path
  end


  def perform(blogger_id)
    blogger = Blogger.find(blogger_id)
    blogger.build_feed(:feed_xml => xml_path(blogger))
    blogger.feed.save
    feedjira_object = Feedjira::Feed.fetch_and_parse(blogger.feed.feed_xml)
    feedjira_object.sanitize_entries! 
    blogger.feed.save
    blogger.feed.add_entries(feedjira_object.entries)
    blogger.feed.entries.each do |entry|
      entry.assign_school_session
      entry.save
    end
  end

end