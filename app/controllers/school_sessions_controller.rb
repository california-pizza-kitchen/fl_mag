class SchoolSessionsController < ApplicationController
  before_action :login_required
  respond_to :html

  def create
    @school_session = SchoolSession.create(strong_params)
    respond_to do |format|
      if @school_session.save
        format.html {redirect_to '/users/show'}
        flash[:"alert-success"] = "Session Added!"
      else
        format.html {redirect_to'/users/show', notice: @school_session.errors.full_messages}
      end
    end
  end

  def edit
    @school_session = SchoolSession.find(params[:id]) 
  end

  def update
    @school_session = SchoolSession.find(params[:id])
    @school_session.update(strong_params)
    respond_to do |format|
      if @school_session.save
        format.html {redirect_to '/users/show'}
        flash[:"alert-success"] = "Session Added!"
      else
        format.html {redirect_to'/users/show', notice: @school_session.errors.full_messages}
      end
    end
  end

  def destroy 
    @school_session = SchoolSession.find(params[:id])
    respond_to do |format|
      if @school_session.destroy
        format.html {redirect_to '/users/show'}
        flash[:"alert-success"] = "Session Removed!"
      else
        format.html {redirect_to'/users/show', notice: @blogger.errors.full_messages}
      end
    end
  end

  private

  def strong_params
    params.require(:school_session).permit(:name)
  end

end