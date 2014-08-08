module API
  module V0
    class SchoolSessionsController < ApplicationController
      def index
        @school_sessions = SchoolSession.all.api_query(params[:order], params[:limit], params[:offset])
        if params[:bloggers]
          render json: @school_sessions.map(&:as_json_bloggers)
        elsif params[:concise]
          render json: @school_sessions.map(&:as_json_concise)
        else
          render json: @school_sessions.map(&:as_json_verbose)
        end
      end

      def show
        @school_session = SchoolSession.find_by(:slug => params[:slug])
        render json: @school_session.as_json_verbose
      end

    end
  end
end
