require 'spec_helper'

describe API::V0::EntriesController, :type => :controller do

  let(:json) { JSON.parse(response.body, symbolize_names: true) }

  before do
    @entry_1 = create(:entry)
    @entry_2 = create(:entry)
    @entry_3 = create(:entry)
  end

  describe 'request for all entries' do
    it 'responds with JSON for all entries' do
      get :index, format: :json

      expect(json).to be_an(Array)
      expect(json.length).to eq(3)
      expect(json.collect{ |j| j[:title] }).to include(@entry_1.title, @entry_2.title, @entry_3.title)
    end

    context 'with query parameters' do
      before do
        @entry_1.update(published: 3.days.ago)
        @entry_2.update(published: 2.days.ago)
        @entry_3.update(published: 1.days.ago)
      end

      context 'limit and offset parameters' do
        it 'limits number of entries by \'limit\' parameter' do
          get :index, format: :json, limit: 2

          expect(json.length).to eq(2)
        end

        it 'offsets the entries by the \'offset\' parameter' do
          get :index, format: :json, limit: 2, offset: 1

          expect(json.length).to eq(2)
          # Default ordering is 'published DESC', see 'order parameter' tests
          expect(json.collect{ |j| j[:title] }).to eq([@entry_2.title, @entry_1.title])
        end
      end

      context 'order parameter' do
        it 'orders entries by \'published DESC\' by default' do
          get :index, format: :json

          expect(json.collect{ |j| j[:title] }).to eq([@entry_3.title, @entry_2.title, @entry_1.title])
        end

        it 'orders the entries by \'order\' param' do
          get :index, format: :json, order: 'published ASC'

          expect(json.collect{ |j| j[:title] }).to eq([@entry_1.title, @entry_2.title, @entry_3.title])
        end
      end
    end
  end

  describe 'request for one entry' do
    it 'responds with one JSON entry object' do
      get :show, slug: @entry_1.slug, format: :json

      expect(json).to be_a(Hash)
      expect(json[:title]).to eq(@entry_1.title)
      expect(json[:content]).to eq(@entry_1.content)
    end
  end

end