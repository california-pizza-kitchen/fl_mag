class SchoolSession < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :bloggers
end