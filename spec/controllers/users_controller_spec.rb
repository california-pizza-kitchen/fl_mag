require 'spec_helper'

describe UsersController do

  context "when user is logged in" do
    before :each do
      login
    end

    describe 'GET #show' do

      it "populates an array of bloggers to @bloggers" do
        jim = create :blogger
        joe = create :blogger
        get :show, id: 1

        expect(assigns(:bloggers)).to match_array([jim, joe])
      end

      it "populates an array of entries to @entires" do
        entry1 = create :entry
        entry2 = create :entry
        get :show, id: 1

        expect(assigns(:entries)).to match_array([entry1, entry2])
      end
    end

    describe 'GET #admin_blog_view' do

      it "assigns requested blog to @entry" do
        entry = create :entry
        get :admin_blog_view, id: 1, entry_slug: entry.slug

        expect(assigns(:entry)).to eq entry
      end
    end

    describe 'GET #admin_blogger_view' do

      it "assigns requested blogger to @blogger" do
        blogger = create :blogger
        get :admin_blogger_view, id: 1, blogger_slug: blogger.slug

        expect(assigns(:blogger)).to eq blogger
      end

      it "populates an array of blogger's entries to @entries" do
        blogger = create :blogger
        blogger.build_feed
        e1 = blogger.feed.entries.build(author: blogger.id)
        e2 = blogger.feed.entries.build(author: blogger.id)
        [e1, e2].each(&:save)
        get :admin_blogger_view, id: 1, blogger_slug: blogger.slug

        expect(assigns(:entries)).to match_array([e1, e2])
      end
    end

    describe 'GET #admin_tag_view' do
      it "assigns the requested tag to @tag" do
        tag = create :tag
        get :admin_tag_view, id: 1, tag_slug: tag.slug
        expect(assigns(:tag)).to eq tag
      end

      it "populates an array of entires by certain tag to @entries" do
        tag = create :tag, word: "test"
        e1, e2 = create(:entry, title: "this is a test"), create(:entry, title: "this is also a test")
        [e1,e2].each{|entry| 
          entry.get_title_tags
          entry.make_all_tags_visible
          entry.save 
        }
        get :admin_tag_view, id: 1, tag_slug: tag.slug

        expect(assigns(:entries)).to match_array([e1,e2])
      end

    end

    describe 'GET #admin_mainpage_view' do
      it "populates an array of entries to @entries" do
        e1, e2, e3 = create(:entry), create(:entry), create(:entry)
        [e1,e2].each(&:publish)
        get :admin_mainpage_view, id: 1
        expect(assigns(:entries)).to match_array([e1,e2])
      end
    end

    describe 'GET #tags' do
      it "populates an array of tags to @tags" do
        t1 = create :tag
        t2 = create :tag
        get :tags, id: 1

        expect(assigns(:tags)).to match_array([t1,t2])
      end
    end

  end

  context "when user is not logged in" do

    describe "GET #index" do
      it "should redirect to login path" do
        get :index
        expect(response).to redirect_to '/login'
      end
    end

    describe 'GET #show' do
      it "should redirect to login path" do
        get :show, id: 1
        expect(response).to redirect_to '/login'
      end
    end

    describe 'GET #admin_blog_view' do
      it "should redirect to login path" do
        entry = create(:entry)
        get :admin_blog_view, id: 1, entry_slug: entry.slug
        expect(response).to redirect_to '/login'
      end
    end

    describe 'GET #admin_blogger_view' do
      it "should redirect to login path" do
        blogger = create(:blogger)
        get :admin_blogger_view, id: 1, blogger_slug: blogger.slug
        expect(response).to redirect_to '/login'
      end
    end

    describe 'GET #admin_tag_view' do
      it "should redirect to login path" do
        tag = create(:tag)
        get :admin_tag_view, id: 1, tag_slug: tag.slug
        expect(response).to redirect_to '/login'
      end
    end

    describe 'GET #admin_mainpage_view' do
      it "should redirect to login path" do
        get :admin_mainpage_view, id: 1
        expect(response).to redirect_to '/login'
      end
    end

    describe 'GET #tags' do
      it "should redirect to login path" do
        get :tags, id: 1
        expect(response).to redirect_to '/login'
      end
    end
  end
end