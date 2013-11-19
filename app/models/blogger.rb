class Blogger < ActiveRecord::Base
  has_one :feed
end