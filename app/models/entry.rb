class Entry < ActiveRecord::Base
  belongs_to :feed
  belongs_to :blogger
  has_many :entries_tags
  has_many :tags, through: :entries_tags

  before_save :slugify!

  def slugify!
    self.title != nil ? self.slug = self.title.downcase.gsub(/[\W,\s]/,'-') : self.slug = self.id
  end

  def self.most_recent
    order("published DESC").limit(1).first
  end
  
  def author_name
    self.feed.blogger.name
  end

  def author_slug
    self.feed.blogger.slug
  end

  def summarize
    if self.content.include?("<p>")
      first = self.content.split("<p>")[1]
      second = self.content.split("<p>")[2]
      "<p>" + first + "<p>" + second if first && second
    else
      self.content
    end
  end

  def self.sort_by_date_published(collection)
    collection.sort_by{|entry| entry.published}.reverse
  end

  def self.featured_entries
    self.where(:added? => true).sort_by{ |entry| entry.mag_published }
  end

  def create_tag(word)
    tag = Tag.create(:word => word)
    entry_tag = self.entries_tags.build(:tag_id => tag.id)
    entry_tag.save
  end

end