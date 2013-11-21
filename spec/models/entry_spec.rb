require 'spec_helper'

describe Entry do
  it "makes a slug from its title on save" do
    e = Entry.new(:title => "HOLY COW ITS A BLOG POST")
    expect(e.slug).to eq(nil)
    e.save
    expect(e.slug).to eq("holy-cow-its-a-blog-post")
  end

  it "gets the most recent entry" do
    e1 = Entry.create(:title => "post1", :published => Time.now)
    e2 = Entry.create(:title => "post2", :published => Time.now)

    expect(Entry.most_recent.title).to eq("post2")
  end 

  it "knows the name and slug of it's writer" do
    joshua = Blogger.create(:name => "Joshua")
    joshua.build_feed
    e1 = joshua.feed.entries.build(:title => "THE BEST POST EVER")
    joshua.feed.save
    e1.save
    expect(e1.author_name).to eq("Joshua")
    expect(e1.author_slug).to eq("joshua")
  end

  it "summarizes it's content" do
    entry = Entry.new(:content => "<p>this</p><p>is</p><p>a</p><p>test</p>")

    expect(entry.summarize).to eq("<p>this</p><p>is</p>")
  end

  it "sorts the entries by the most recent publish date, given a collection" do
    e1 = Entry.create(:title => "post1", :published => Time.now)
    e2 = Entry.create(:title => "post2", :published => Time.now)

    expect(Entry.sort_by_date_published(Entry.all).first.title).to eq("post2")
    expect(Entry.sort_by_date_published(Entry.all).last.title).to eq("post1")
  end

end