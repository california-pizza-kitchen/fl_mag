class TagsController < ApplicationController
  before_action :login_required

  def edit
    @tag = Tag.find(params[:id])
  end


  def find_or_create
    # binding.pry
    tag = Tag.find_or_create_by(:word => params[:tag][:word].downcase)
    EntriesTag.create do |et|
      et.entry_id = params[:tag][:entry]
        et.tag_id = tag.id
       et.visible = true
    end
    success_msg = {tag_word: tag.word}
    render json: success_msg
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