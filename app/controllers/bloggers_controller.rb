class BloggersController < ApplicationController
  respond_to :html
  before_action :login_required, except: [:index, :show]

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find_by(:slug => params[:slug])
    @entries = Entry.where(:author => @blogger.id).page(params[:page]).per_page(10).order('mag_published ASC')
  end


  def create
    @blogger = Blogger.create(blogger_params)
    @school_session = SchoolSession.find_by(:id => params[:blogger][:school_session])
    @blogger.update(:school_session => @school_session)

    if @blogger.feed_url
      if @blogger.feed_url.end_with?('/')
        @blogger.update(
          :feed_url => @blogger.feed_url[0..-2]
        )
      end
    end

    CreateWorker.perform_async(@blogger.id)
    respond_to do |format|
      if @blogger.save
        format.html {redirect_to '/users/show'}
        flash[:"alert-success"] = "Blogger Added!"
      else
        format.html {redirect_to'/users/show', notice: @blogger.errors.full_messages}
      end
    end
  end

  def destroy
    # -- destroys entries and feed as well as blogger
    @blogger = Blogger.find_by(:slug => params[:blogger_slug])
    respond_to do |format|
      if @blogger.completely_destroy
        format.html {redirect_to '/users/show'}
        flash[:"alert-success"] = "Blogger Removed!"
      else
        format.html {redirect_to'/users/show', notice: @blogger.errors.full_messages}
      end
    end
  end

  def edit
    @blogger = Blogger.find_by(:slug => params[:slug])
  end

  def update
    @blogger = Blogger.find_by(:id => params[:slug])
    old_url = @blogger.feed_url

    if old_url != params[:blogger][:feed_url]
      @blogger.completely_destroy
      @blogger = Blogger.create(blogger_params)
      if @blogger.feed_url
        if @blogger.feed_url.end_with?('/')
          @blogger.update(
            :feed_url => @blogger.feed_url[0..-2]
          )
        end
      end
      CreateWorker.perform_async(@blogger.id)
    end

    respond_to do |format|
      if @blogger.update(blogger_params)
        format.html {redirect_to '/users/show'}
        flash[:"alert-success"] = "Blogger Added!"
      else
        format.html {redirect_to'/users/show', notice: @blogger.errors.full_messages}
      end
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :semester, :id, :feed_url, :twitter_handle)
  end
end
