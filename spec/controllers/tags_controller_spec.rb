require 'spec_helper'

describe TagsController do
  before :each do 
    @current_user = User.create
    session[:user_id] = @current_user.id
  end

  describe "GET #edit" do
    it "assigns the requested tag to @tag" do
      tag = create(:tag)
      get :edit, id: tag.id
      expect(assigns(:tag)).to eq tag
    end
  
    # it "assigns the requested tag to @tag" do
    #   get :index_by_tag, tag_slug: @tag.slug
    #   expect(assigns(:tag)).to eq @tag
    # end


  end
end