require 'spec_helper'

describe Blogger, :type => :model do
  before :each do
    @blogger = create(:blogger)
    @blogger2 = build(:invalid_blogger)
  end

  after :each do
    @blogger.destroy
  end

  it "needs a name to be valid" do
    expect(@blogger2).to have(1).errors_on(:name)
  end

  it "needs a feed_url to be valid" do
    expect(@blogger2).to have(1).errors_on(:feed_url)
  end

  it "must have a unique feed_url to be valid" do
    @blogger2.feed_url = @blogger.feed_url
    expect(@blogger2).to have(1).errors_on(:feed_url)
  end

  it "makes a slug of its name" do
    expect(@blogger.slug).to eq(@blogger.name.downcase.gsub(" ","-").gsub(".","-"))
  end

  it "keeps a count of it's published blogs" do
    @blogger.build_feed
    @blogger.feed.entries.build(added?: true)
    @blogger.feed.save
    expect(@blogger.published_entries).to eq(1)
  end
end