require 'spec_helper'

describe TagsController do
  before :each do
    @tag = create(:tag)
  end

  context "when the user is signed in" do 
    before :each do
      login
    end

    describe "GET #edit" do
      it "assigns the requested tag to @tag" do
        get :edit, id: @tag.id
        expect(assigns(:tag)).to eq @tag
      end

      it "renders the tags#edit view" do
        get :edit, id: @tag.id
        expect(response).to render_template :edit
      end
    end
  end

  context "when not logged in" do
    describe "GET #edit" do
    end
  end
end