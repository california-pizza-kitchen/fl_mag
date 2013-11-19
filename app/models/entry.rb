class Entry < ActiveRecord::Base
  belongs_to :feed


  def self.sort_by_date_published
    self.all.sort_by{|entry| entry.published}.reverse
  end
end