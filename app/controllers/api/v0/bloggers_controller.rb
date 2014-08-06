module API
  module V0
    class BloggersController < ApplicationController
      def show
        @blogger = Blogger.find_by(:slug => params[:slug])
        render json: @blogger.as_json
      end

      def index
        if params[:school_session_slug]
          @school_session = SchoolSession.find_by(slug: params[:school_session_slug])
          @bloggers = Blogger.where(:school_session_id => @school_session.id)
        else
          @bloggers = Blogger.all
        end
        
        render json: @bloggers.map(&:as_json)
      end
    end
  end
end
