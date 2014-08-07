module API
  module V0
    class EntriesController < ApplicationController
      def index
        if params[:school_session_slug]
          @school_session = SchoolSession.find_by(slug: params[:school_session_slug])
          @entries = Entry.where(:school_session_id => @school_session.id).api_query(params[:order], params[:limit], params[:offset])
        elsif params[:blogger_slug]
          @entries = Blogger.find_by(:slug => params[:blogger_slug]).entries.api_query(params[:order], params[:limit], params[:offset])
        else
          @entries = Entry.api_query(params[:order], params[:limit], params[:offset])
        end

        if params[:concise] == "true"
          render json: @entries.map(&:as_json_concise)
        else
          render json: @entries.map(&:as_json_verbose)
        end
      end

      def show
        @entry = Entry.find_by(:slug => params[:slug])
        render json: @entry.as_json_verbose
      end
    end
  end
end
