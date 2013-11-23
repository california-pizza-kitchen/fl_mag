class Tag < ActiveRecord::Base
  has_many :entries_tags
end