module API
  module V0
    class EntriesController < ApplicationController
      def show
        @entry = Entry.find_by(:slug => params[:slug])
        render json: @entry.as_json
      end

      def index
        if params[:school_session_slug]
          @school_session = SchoolSession.find_by(slug: params[:school_session_slug])
          @entries = Entry.where(:school_session_id => @school_session.id).order(:published => :desc)
        elsif params[:blogger_slug]
          @entries = Blogger.find_by(:slug => params[:blogger_slug]).entries.sort_by(&:published).reverse
        else
          @entries = Entry.order(:published => :desc)
        end

        render json: @entries.map(&:as_json)
      end
    end
  end
end
