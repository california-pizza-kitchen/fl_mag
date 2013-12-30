require 'spec_helper'

describe Entry do
  before :each do
    @entry = Entry.create(
      title: "Title of this Blog",
      published: Time.now
    )
  end

  it "makes a slug of it's title" do
    entry = Entry.create(
      title: "Title of Blog"
      )
    expect(entry.slug).to eq("title-of-blog")
  end

  it "knows it's most recently published blog" do
    entry2 = Entry.create(published: Time.now)
    expect(Entry.most_recent).to eq(entry2)
  end

  it "knows it's authors name, slug and twitter_handle" do
    kyle = Blogger.create(name: "Kyle", feed_url: "www.not_a_website.com", twitter_handle: "@kyleshike")
    kyle.build_feed
    kyle.feed.entries << @entry
    kyle.feed.save
    expect(@entry.author_name).to eq("Kyle")
    expect(@entry.author_slug).to eq("kyle")
    expect(@entry.twitter_handle).to eq("@kyleshike")
  end

  it "can be published" do
    @entry.publish
    expect(@entry.mag_published).to_not eq(nil)
  end

  it "summarizes content with its <p> tags" do
    @entry.content = "<p>it was the</p><p>best of times,</p><p>it was the</p><p>worst of times</p>"
    expect(@entry.summarize).to eq("<p>it was the</p><p>best of times,</p>")
  end

  it "summarizes content when it does not have <p> tags" do
    @entry.content = "it was the best of times, it was the wost of times"
    expect(@entry.summarize).to eq("<p>it was the best of times, it was the wost of times</p>")
  end

  context "tags" do
    it "knows its tags" do
      tag = Tag.create(word: "yo")
      @entry.entries_tags.create(tag_id: tag.id, visible: true)
      @entry.entries_tags.first.save
      expect(@entry.tags_added).to include tag
    end

    it "gets tags from content" do
      @entry.content = "flufernutter flufernutter flufernutter flufernutter"
      @entry.get_tags
      expect(@entry.tags.first.word).to eq "flufernutter" 
    end

    it "gets tags from its title" do
      @entry.get_title_tags
      expect(@entry.tags.count).to eq(3)
    end

  end

  context "sorting" do
    it "knows what entries have been published" do
      @entry.update(added?: true)
      expect(Entry.featured_entries.count).to eq 1
    end

    it "sorts by most recently published by admin of this blog" do
      @entry.publish
      entry = Entry.create
      entry.publish
      expect(Entry.featured_by_date_published.first).to eq(entry)
    end

    it "collects entries with common tags" do
      @entry.get_title_tags
      other_entry = Entry.create(title: "How to Blog")
      other_entry.get_title_tags
      [@entry, other_entry].each{ |entry| entry.make_all_tags_visible }
      tag = Tag.find_by(slug: "blog")
      expect(Entry.collect_by_tag(tag.id).count).to eq(2)
    end
  end
end