require_relative '../spec_helper'

describe Feed do

  it "can fetch an XML feed" do
    feed = Feedzirra::Feed.fetch_and_parse("http://kyleshike.github.io/atom.xml")

    expect(feed).class.to eq("FeedZirra::Parser::Atom")
  end

  it "can add entries to the database" do
    feed = Feedzirra::Feed.fetch_and_parse("http://kyleshike.github.io/atom.xml")
    add_entries(feed.entries)
  end

end


# feed = Feedzirra::Feed.fetch_and_parse("http://kyleshike.github.io/atom.xml")