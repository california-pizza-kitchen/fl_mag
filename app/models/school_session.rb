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

  def as_json
    {
      "name" => self.name,
      "slug" => self.slug,
      "_self" => "#{ENV['API_ROOT']}/school_sessions/#{self.slug}",
      "bloggers_count" => self.bloggers_count,
      "bloggers" => self.bloggers.collect{|blogger|
          {
            "name" => blogger.name,
            "number_of_entries" => blogger.entries.length,
            "_self" => "#{ENV['API_ROOT']}/bloggers/#{blogger.slug}"
          }
        },
      "entries_count" => self.entries_count,
      "entries" => self.entries.collect do |entry|
        {
          "title" => entry.title,
          "_self" => "#{ENV['API_ROOT']}/bloggers/#{entry.feed.blogger.slug}/entries/#{entry.slug}",
          "blogger" =>  {
                          "name" => entry.feed.blogger.name,
                          "_self" => "#{ENV['API_ROOT']}/bloggers/#{entry.feed.blogger.slug}"
                        }
        }
      end
    }
  end

end