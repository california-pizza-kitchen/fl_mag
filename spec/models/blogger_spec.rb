require 'spec_helper'

describe Blogger do

  it "makes a slug from its name on save" do
    b = Blogger.new(:name => "JohnBro", :feed_xml => "test")
    expect(b.slug).to eq(nil)
    b.save
    expect(b.slug).to eq("johnbro")
  end

  it "has a feed" do
    jimbro = Blogger.create(:name => "JimBro")
    jimbro.build_feed

    expect(jimbro.feed.class).to eq(Feed)
  end

  it "has entries through a feed" do 
    joshua = Blogger.create(:name => "Joshua")
    joshua.build_feed
    e1 = joshua.feed.entries.build(:title => "THE BEST POST EVER")
    joshua.feed.save
    e1.save
    expect(joshua.feed.entries.count).to eq(1)
  end

end