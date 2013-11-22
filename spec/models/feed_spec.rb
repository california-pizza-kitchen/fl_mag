require 'spec_helper'

describe Feed do

  it "can fetch an XML feed" do
    feed = FeedZirra::Feed.fetch_and_parse("http://kyleshike.github.io/atom.xml")

    expect(feed).class.to eq("FeedZirra::Parser::Atom")
  end

  it "can add entries to the database" do
    feed = FeedZirra::Feed.fetch_and_parse("http://kyleshike.github.io/atom.xml")
    add_entries(feed.entries)
  end

end


feed = FeedZirra::Feed.fetch_and_parse("http://kyleshike.github.io/atom.xml")