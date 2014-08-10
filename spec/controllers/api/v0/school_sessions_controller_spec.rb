require 'spec_helper'

describe API::V0::SchoolSessionsController, :type => :controller do

  let(:json) { JSON.parse(response.body, symbolize_names: true) }

  before do
    @school_session_1 = create(:school_session)
    @school_session_2 = create(:school_session)
    @school_session_3 = create(:school_session)
  end
  
  describe 'GET /school_sessions' do
    it 'responds with all school sessions' do
      get :index, format: :json

      expect(json).to be_an(Array)
      expect(json.length).to eq(3)
      expect(json.collect{|j| j[:name]}).to include(@school_session_1.name)
    end

    context 'has bloggers as a nested resource' do
      before do
        @blogger_1 = create(:blogger)
        @blogger_2 = create(:blogger)
        @blogger_3 = create(:blogger)
        @blogger_4 = create(:blogger)
        @school_session_1.bloggers = [@blogger_1, @blogger_2, @blogger_3, @blogger_4]
      end

      it "displays a school session's bloggers and bloggers_count" do
        get :index, format: :json

        expect(json.first[:bloggers]).to be_an(Array)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:bloggers_count]).to eq(4)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:bloggers].first[:name]).to eq(@blogger_1.name)
      end
    end

    context 'has entries as a nested resource' do
      before do
        @entry_1 = create(:entry)
        @entry_2 = create(:entry)
        @entry_3 = create(:entry)
        @entry_4 = create(:entry)
        @school_session_1.entries = [@entry_1, @entry_2, @entry_3, @entry_4]
      end

      it "displays a school session's entries and entries_count" do
        get :index, format: :json

        expect(json.first[:entries]).to be_an(Array)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:entries_count]).to eq(4)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:entries].first[:title]).to eq(@entry_1.title)
      end
    end

    context 'with query parameters' do
      before do
        @school_session_1.update(start_date: 3.days.ago)
        @school_session_2.update(start_date: 2.days.ago)
        @school_session_3.update(start_date: 1.days.ago)
      end

      context 'limit and offset parameters' do
        it 'limits number of school sessions by \'limit\' parameter' do
          get :index, format: :json, limit: 2

          expect(json.length).to eq(2)
        end

        it 'offsets the school sessions by the \'offset\' parameter' do
          get :index, format: :json, limit: 2, offset: 1

          expect(json.length).to eq(2)
          # Default ordering is 'start_date DESC', see 'order parameter' tests
          expect(json.collect{ |j| j[:name] }).to eq([@school_session_2.name, @school_session_1.name])
        end
      end

      context 'order parameter' do
        it 'orders school sessions by \'start_date DESC\' by default' do
          get :index, format: :json

          expect(json.collect{ |j| j[:name] }).to eq([@school_session_3.name, @school_session_2.name, @school_session_1.name])
        end

        it 'orders the school sessions by \'order\' param' do
          get :index, format: :json, order: 'start_date ASC'

          expect(json.collect{ |j| j[:name] }).to eq([@school_session_1.name, @school_session_2.name, @school_session_3.name])
        end
      end
    end

  end

  describe 'GET /school_sessions/:school_session_slug' do
    it 'responds with one school session' do
      get :show, slug: @school_session_1.slug, format: :json

      expect(json).to be_a(Hash)
      expect(json[:name]).to eq(@school_session_1.name)
    end

    context 'has bloggers as a nested resource' do
      before do
        @blogger_1 = create(:blogger)
        @blogger_2 = create(:blogger)
        @blogger_3 = create(:blogger)
        @blogger_4 = create(:blogger)
        @school_session_1.bloggers = [@blogger_1, @blogger_2, @blogger_3, @blogger_4]
      end

      it "displays a school session's bloggers and bloggers_count" do
        get :index, slug: @school_session_1.slug, format: :json

        expect(json.first[:bloggers]).to be_an(Array)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:bloggers_count]).to eq(4)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:bloggers].first[:name]).to eq(@blogger_1.name)
      end
    end

    context 'has entries as a nested resource' do
      before do
        @entry_1 = create(:entry)
        @entry_2 = create(:entry)
        @entry_3 = create(:entry)
        @entry_4 = create(:entry)
        @school_session_1.entries = [@entry_1, @entry_2, @entry_3, @entry_4]
      end

      it "displays a school session's entries and entries_count" do
        get :index, slug: @school_session_1.slug, format: :json

        expect(json.first[:entries]).to be_an(Array)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:entries_count]).to eq(4)
        expect(json.detect{|j| j[:name] == @school_session_1.name }[:entries].first[:title]).to eq(@entry_1.title)
      end
    end
  end

  # This does not work, not sure how (or if) to test nested routes
  # describe 'GET /school_sessions/:school_session_slug/bloggers' do
  #   before do
  #     @blogger_1 = create(:blogger)
  #     @blogger_2 = create(:blogger)
  #     @blogger_3 = create(:blogger)
  #     @blogger_4 = create(:blogger)
  #     @school_session_1.bloggers = [@blogger_1, @blogger_2, @blogger_3, @blogger_4]
  #   end

  #   it 'responds with all bloggers from the specified school session' do
  #     get "school_sessions/#{@school_session_1.slug}/bloggers", format: :json

  #     expect(json).to be_an(Array)
  #     expect(json.length).to eq(4)
  #     expect(json.collect{|j| j[:name]}).to include(@school_session_1.name)
  #   end

  # end
end
