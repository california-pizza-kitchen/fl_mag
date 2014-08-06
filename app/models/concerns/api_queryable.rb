module APIQueryable
  extend ActiveSupport::Concern

  module ClassMethods

    def default_order
      "created_at DESC"
    end

    def default_limit
      10
    end

    def api_query(order, limit, offset)
      order ||= default_order
      limit ||= default_limit
      self.order(order)
          .limit(limit)
          .offset(offset)
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end