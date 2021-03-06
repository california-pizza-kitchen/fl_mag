module API
  module V0
    class BloggersController < ApplicationController
      def index
        if params[:school_session_slug]
          @school_session = SchoolSession.find_by(slug: params[:school_session_slug])
          @bloggers = Blogger.where(:school_session_id => @school_session.id).api_query(params[:order], params[:limit], params[:offset])
        else
          @bloggers = Blogger.api_query(params[:order], params[:limit], params[:offset])
        end

        render json: @bloggers.map(&:as_json)
      end

      def show
        @blogger = Blogger.find_by(:slug => params[:slug])
        render json: @blogger.as_json
      end

    end
  end
end
