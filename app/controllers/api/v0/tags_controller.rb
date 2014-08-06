module API
  module V0
    class TagsController < ApplicationController
      def show
        @tag = Tag.find_by(word: params[:word])
        render json: @tag.as_json_verbose
      end

      def index
        @tags = Tag.all
        render json: @tags.map(&:as_json_concise)
      end
    end
  end
end
