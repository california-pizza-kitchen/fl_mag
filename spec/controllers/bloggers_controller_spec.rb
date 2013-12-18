require 'spec_helper'

describe BloggersController do
  
  describe "GET #index" do
    it "populates an array of bloggers" do
      joe = create(:blogger)
      bro = create(:blogger)
      get :index

      expect(assigns(:bloggers)).to match_array([joe, bro])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it 'assigns the requested blogger to @blogger' do
      joe = create(:blogger)
      get :show, slug: joe.slug
      expect(assigns(:blogger)).to eq joe
    end

    it 'renders the :show template' do
      joe = create(:blogger)
      get :show, slug: joe.slug
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new blogger to the database" do
        expect{
          post :create, blogger: attributes_for(:blogger)
        }.to change(Blogger, :count).by(1)
      end

      it "redirects to users#show" do
        post :create, blogger: attributes_for(:blogger)
        expect(response).to redirect_to "/users/show"
      end
    end

    context "with invalid attributes" do
      it "does not save the blogger to the database" do
        expect{
          post :create, blogger: attributes_for(:invalid_blogger)
        }.to_not change(Blogger, :count)
      end

      it "redirects to users#show with an error notice" do
        pending "how to stub a chron job?"
      end
    end
  end
end