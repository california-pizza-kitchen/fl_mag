class SchoolSession < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :slug, uniqueness: true
  has_many :bloggers
  has_many :entries
  before_save :slugify!

  def slugify!
    self.slug = self.name.downcase.gsub(/[\W,\s]/,'-')
  end


  def bloggers_count
    self.bloggers.count
  end

  def entries_count
    self.entries.count
  end

end