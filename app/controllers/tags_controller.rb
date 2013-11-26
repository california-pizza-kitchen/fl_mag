class TagsController < ApplicationController
  before_action :login_required

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to '/users/1/tags'
  end

  def ignore
    @tag = Tag.find(params[:id])
    @tag.update(:ignore => true)
    redirect_to '/users/1/tags'
  end

  private

  def tag_params
   params.require(:tag).permit(:display_word)
  end

end