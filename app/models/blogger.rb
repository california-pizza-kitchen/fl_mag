class Blogger < ActiveRecord::Base
  validates :feed_url, uniqueness: true 
  validates :name, :feed_url, presence: true
  has_one :feed
  has_many :entries, through: :feed
  belongs_to :school_session


  before_save :slugify!

  def slugify!
    self.slug = self.name.downcase.gsub(/[\W,\s]/,'-')
  end

  def most_recent_entry
    self.entries.most_recent
  end

  def published_entries
    self.entries.where(:added? => true).count
  end

  def school_session_or_placeholder
    if self.school_session
      school_session.name
    else
      "unassigned"
    end
  end

  def destroy_entries_and_feed
    self.feed.entries.each do |entry|
      entry.destroy
    end
    self.feed.destroy
  end

  def completely_destroy
    if self.feed
      self.feed.entries.each do |entry|
        entry.destroy
      end
      self.feed.destroy
    end
    self.destroy
  end

end
