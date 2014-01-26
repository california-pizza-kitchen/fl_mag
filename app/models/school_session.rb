class SchoolSession < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :bloggers
  before_save :slugify!

  def slugify!
    self.slug = self.name.downcase.gsub(/[\W,\s]/,'-')
  end

end