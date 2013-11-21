class Blogger < ActiveRecord::Base
  validates :feed_xml, uniqueness: true 
  validates :name, :feed_xml, presence: true
  has_one :feed
  has_many :entries, through: :feed

  before_save :slugify!

  def slugify!
    self.slug = self.name.downcase.gsub(/[\W,\s]/,'-')
  end

  def most_recent_entry
    self.entries.most_recent
  end

  def url
    self.feed_xml[0..-9]
  end

end
