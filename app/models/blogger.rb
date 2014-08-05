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

  def school_session_slug_or_placeholder
    if self.school_session
      school_session.slug
    else
      "unassigned"
    end
  end

  def self.no_session_count
    where(:school_session_id => nil).count
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

  def as_json
    {
      "name" => self.name,
      "school_session" => self.school_session_slug_or_placeholder,
      "number_of_entries" => self.entries.length,
      "last_published_at" => self.entries.sort_by(&:published).last.published,
      "blog_url" => self.feed_url,
      "url" => "#{ENV['ROOT_URL']}/bloggers/#{self.slug}",
      "_self" => "#{ENV['API_ROOT']}/bloggers/#{self.slug}",
      "entries" => self.entries.collect do |entry|
        {
          "title" => entry.title,
          "slug" => entry.slug,
          "published_date" => entry.published,
          "blog_url" => entry.url,
          "url" => "#{ENV['ROOT_URL']}/bloggers/#{self.slug}/entries/#{entry.slug}",
          "_self" => "#{ENV['API_ROOT']}/bloggers/#{self.slug}/entries/#{entry.slug}",
          "content" => entry.content.html_safe
        }
      end
    }
  end

end
