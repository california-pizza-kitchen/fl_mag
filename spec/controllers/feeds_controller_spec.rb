require 'spec_helper'

describe FeedsController do
  before :each do
    @entry_1 = create(:entry, added?: true, mag_published: Time.now)
    @entry_2 = create(:entry, added?: true, mag_published: Time.now)
  end
  
  describe "GET :index" do
    it 'populates an array of published entries' do
      get :index
      expect(assigns(:entries)).to match_array([@entry_1, @entry_2])
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET :index_by_tag" do
    before :each do
      @tag = create(:tag)
      EntriesTag.create(tag_id: @tag.id, entry_id: @entry_1.id, visible: true)
      EntriesTag.create(tag_id: @tag.id, entry_id: @entry_2.id, visible: true)
    end

    it "assigns the requested tag to @tag" do
      get :index_by_tag, tag_slug: @tag.slug
      expect(assigns(:tag)).to eq @tag
    end

    it "populates an array of entries by a tag" do
      get :index_by_tag, tag_slug: @tag.slug
      expect(assigns(:entries)).to match_array([@entry_1, @entry_2])
    end

    it "populates an array random published entries" do
      entry_3 = create(:entry)
      get :index_by_tag, tag_slug: @tag.slug
      expect(assigns(:all_entries)).to_not include entry_3
    end

    it "renders the index_by_tag view" do
      get :index_by_tag, tag_slug: @tag.slug
      expect(response).to render_template :index_by_tag
    end
  end
end