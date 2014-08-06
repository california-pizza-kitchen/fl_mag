module API
  module V0
    class SchoolSessionsController < ApplicationController
      def index
        @school_sessions = SchoolSession.all.api_query(params[:order], params[:limit], params[:offset])
        render json: @school_sessions.map(&:as_json)
      end

      def show
        @school_session = SchoolSession.find_by(:slug => params[:slug])
        render json: @school_session.as_json
      end

      # private

      #   def blogger_query_params
      #     params.permit(:limit, :order, :offset)
      #   end

    end
  end
end
