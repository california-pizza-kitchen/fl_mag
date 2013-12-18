require 'spec_helper'

describe EntriesController do
  before :each do 
    @entry = create(:entry) 
    @joe = create(:blogger)
  end

  describe "GET :show" do
    it "assigns the requested entry to @entry" do
      @joe.build_feed
      @joe.feed.add_entries([@entry])
      get :show, blogger_slug: @joe.slug, slug: @entry.slug
      expect(assigns(:entry)).to eq @entry
    end

    it "assigns the request blogger to @blogger" do
      expect(assigns(:blogger)).to eq @blogger
    end
  end

  describe "publish" do
    it "assigns the requested entry to @entry" do
      get :publish, slug: @entry.slug
      expect(assigns(:entry)).to eq @entry
    end

    it "calls publish on an entry" do
      pending "how to stub out a method call?"
      # expect(@entry).to receive(:publish)
      get :publish, slug: @entry.slug
      expect(@entry.added?).to eq true
    end

    it "redirects to users#show" do
      get :publish, slug: @entry.slug
      expect(response).to redirect_to "/users/1"
    end
  end

  describe "tag" do
    it "assigns the requested entry_tag to @entry_tag" do
      pending "not working yet"
      @tag = Tag.create(word: 'yo')
      get :tag, tag_id: @tag.id, entry_id: @entry.id
      expect(:entry_tag.visible).to eq true
    end
  end
end