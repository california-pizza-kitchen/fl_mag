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
      "name" => name,
      "school_session" => school_session_slug_or_placeholder,
      "number_of_entries" => entries.length,
      "last_published_at" => entries.sort_by(&:published).last.published,
      "blog_url" => feed_url,
      "url" => "#{ENV['ROOT_URL']}/bloggers/#{slug}",
      "_self" => "#{ENV['ROOT_URL']}/bloggers/#{slug}.json",
      "entries" => entries.collect do |entry|
        {
          "title" => entry.title,
          "slug" => entry.slug,
          "published_date" => entry.published,
          "blog_url" => entry.url,
          "url" => "#{ENV['ROOT_URL']}/bloggers/#{slug}/entries/#{entry.slug}",
          "_self" => "#{ENV['ROOT_URL']}/bloggers/#{slug}/entries/#{entry.slug}.json",
          "summary" => entry.summarize.html_safe,
          "tags" => entry.tags.collect do |tag|
            {
              "name" => tag.display_word_or_word,
              "url" => "#{ENV['ROOT_URL']}/tags/#{tag.slug}",
              "_self" => "#{ENV['ROOT_URL']}/tags/#{tag.slug}.json"
            }
          end
        }
      end
    }
  end

end
