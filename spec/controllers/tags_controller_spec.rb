require 'spec_helper'

describe TagsController, :type => :controller do
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

    describe "GET #find_or_create" do
      before :each do
        @entry = create(:entry)
      end

      it "creates the association between entry and tag" do
        get :find_or_create, { tag: { word: @tag.word, entry: @entry.id } }
        expect(@entry.tags).to include @tag
      end

      it "returns a json object for javascript to read" do
        pending "how to test json render?"
        fail
      end
    end

    describe "POST #update" do

      it "assigns the requested tag to @tag" do
        get :update, id: @tag.id, tag: {display_word: nil}
        expect(assigns(:tag)).to eq @tag
      end

      it "updates the @tag attributes" do
        get :update, id: @tag.id, tag: {display_word: "yo"}
        @updated_tag = Tag.find(@tag.id)
        expect(@updated_tag.display_word).to eq "yo"
      end

      it "redirects to the tags view" do
        get :update, id: @tag.id, tag: {display_word: "yo"}
        expect(response).to redirect_to "/users/1/tags"
      end
    end

    describe "GET #ignore" do

      it "assigns the requested tag to @tag" do
        get :ignore, id: @tag.id
        expect(assigns(:tag)).to eq @tag
      end

      it "updates the @tag attributes" do
        expect(@tag.ignore).to eq false
        get :ignore, id: @tag.id
        @updated_tag = Tag.find(@tag.id)
        expect(@updated_tag.ignore).to eq true
      end

      it "redirects to the tags view" do
        get :update, id: @tag.id, tag: {display_word: "yo"}
        expect(response).to redirect_to "/users/1/tags"
      end
    end
  end

  context "when not logged in" do
    describe "GET #edit" do
      it "redirects to the login path" do
        get :edit, id: @tag.id
        expect(response).to redirect_to "/login"
      end
    end

    describe "GET #find_or_create" do
      before :each do
        @entry = create(:entry)
      end

      it "does not create the association between entry and tag" do
        get :find_or_create, { tag: { word: @tag.word, entry: @entry.id } }
        expect(@entry.tags).to_not include @tag
      end

      it "returns a json object for javascript to read" do
        pending "is there ever a chance that this method is called when not logged in?"
        fail
      end
    end

    describe "GET #ignore" do

      it "redirects to the login path" do
        get :edit, id: @tag.id
        expect(response).to redirect_to "/login"
      end

      it "does not update the @tag attributes" do
        expect(@tag.ignore).to eq false
        get :ignore, id: @tag.id
        @updated_tag = Tag.find(@tag.id)
        expect(@updated_tag.ignore).to eq false
      end
    end
  end
end