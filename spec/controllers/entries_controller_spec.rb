require 'spec_helper'

describe EntriesController, :type => :controller do
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

    it "renders the entries#show view" do
      get :show, blogger_slug: @joe.slug, slug: @entry.slug
      expect(response).to render_template :show
    end
  end

  describe "publish" do
    context "when user is logged in" do
      before :each do
        login
      end

      it "assigns the requested entry to @entry" do
        get :publish, slug: @entry.slug
        expect(assigns(:entry)).to eq @entry
      end

      it "calls publish on an entry" do
        get :publish, slug: @entry.slug
        expect(assigns(:entry).added?).to be_truthy
      end

      it "redirects to users#show" do
        get :publish, slug: @entry.slug
        expect(response).to redirect_to "/users/1"
      end
    end

    context "when not logged in" do

      it "redirects to the login path" do
        get :publish, slug: @entry.slug
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe "tag" do
    before :each do
      login
    end

    it "assigns the requested entry_tag to @entry_tag" do
      @entry.get_title_tags
      tag = @entry.tags.first
      entry_tag = EntriesTag.find_by(entry_id: @entry.id, tag_id: tag.id)
      get :tag, tag_id: tag.id, entry_id: @entry.id

      expect(assigns(:entry_tag)).to eq entry_tag
    end

    it "makes the tag in question visible" do
      @entry.get_title_tags
      tag = @entry.tags.first
      entry_tag = EntriesTag.find_by(entry_id: @entry.id, tag_id: tag.id)
      get :tag, tag_id: tag.id, entry_id: @entry.id

      expect(assigns(:entry_tag).visible).to be_truthy
    end
  end
end