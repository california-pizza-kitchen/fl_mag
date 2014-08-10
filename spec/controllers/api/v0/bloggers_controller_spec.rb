require 'spec_helper'

describe API::V0::BloggersController, :type => :controller do

  let(:json) { JSON.parse(response.body, symbolize_names: true) }

  before do
    @blogger_1 = create(:blogger)
    @blogger_2 = create(:blogger)
    @blogger_3 = create(:blogger)
  end

  describe 'request for all bloggers' do
    it 'responds with JSON for all bloggers' do
      get :index, format: :json

      expect(json).to be_an(Array)
      expect(json.length).to be(3)
      expect(json.collect{ |j| j[:name] }).to include(@blogger_1.name, @blogger_2.name, @blogger_3.name)
    end

    context 'with query parameters' do
      before do
        @blogger_1.update(name: "Aaron Aardvark")
        @blogger_2.update(name: "Matthias Michael")
        @blogger_3.update(name: "Zaphod Zzymore")
      end

      describe 'limit and offset parameters' do
        it 'limits number of bloggers by \'limit\' parameter' do
          get :index, format: :json, limit: 2

          expect(json.length).to eq(2)
        end

        it 'offsets the bloggers by the \'offset\' parameter' do
          get :index, format: :json, limit: 2, offset: 1

          expect(json.length).to eq(2)
          # Default ordering is 'name ASC', see 'order parameter' tests
          expect(json.collect{ |j| j[:name] }).to eq([@blogger_2.name, @blogger_3.name])
        end
      end

      describe 'order parameter' do
        it 'orders bloggers by \'name ASC\' by default' do
          get :index, format: :json

          expect(json.collect{ |j| j[:name] }).to eq([@blogger_1.name, @blogger_2.name, @blogger_3.name])
        end

        it 'orders the bloggers by \'order\' param' do
          get :index, format: :json, order: 'name DESC'

          expect(json.collect{ |j| j[:name] }).to eq([@blogger_3.name, @blogger_2.name, @blogger_1.name])
        end
      end
    end
  end

  describe 'request for a single blogger' do
    it 'responds with one JSON blogger object' do
      get :show, slug: @blogger_1.slug, format: :json

      expect(json).to be_a(Hash)
      expect(json[:name]).to eq(@blogger_1.name)
      expect(json[:blog_url]).to eq(@blogger_1.feed_url)
    end
  end
end