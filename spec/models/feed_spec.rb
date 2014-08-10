require 'spec_helper'

describe Feed, :type => :model do

  it "fetches and sanitizes entries from feed url" do
    url = "http://kyleshike.github.io/atom.xml"
    feed = Feedjira::Feed.fetch_and_parse(url)
    feed = feed.sanitize_entries!
    expect(Feed.fetch(url).first.content).to eq feed.first.content
  end


  describe "creating entry objects" do
    before :each do
      url = "http://kyleshike.github.io/atom.xml"
      rss_entries = Feed.fetch(url)
      @feed = build :feed
      @feed.add_entries(rss_entries)
    end

    it "creates entries from return of feed fetching" do
      expect(@feed.entries).to_not be_nil
    end

    it "gets tags for the entries" do
      expect(@feed.entries.first.tags).to_not be_nil
    end
  end
end