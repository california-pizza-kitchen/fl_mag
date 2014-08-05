class Tag < ActiveRecord::Base
  has_many :entries_tags
  before_save :slugify!

  def slugify!
    self.slug = self.word.downcase.gsub(/[\W,\s]/,'-')
  end

  def display_word_or_word
    self.display_word != nil ? self.display_word : self.word
  end

  def self.alphabetized
    self.all.sort_by do |tag| 
      tag.word.downcase if tag.word.respond_to?(:downcase)
    end
  end

  def self.all_tagged_tags
    self.joins(:entries_tags).where(:entries_tags => {:visible => true } )
  end

  def entries
    self.entries_tags.map(&:entry)
  end

  def as_json_concise
    {
      "tag" => self.word,
      "entries_count" => self.entries.size,
      "_self" => "#{ENV['ROOT_URL']}/tags/#{self.word}.json",
    }
  end

  def as_json_verbose
    {
      "tag" => self.word,
      "entries_count" => self.entries.size,
      "_self" => "#{ENV['ROOT_URL']}/tags/#{self.word}.json",
      "entries" => self.entries.collect do |entry|
        {
          "title" => entry.title,
          "blog_url" => entry.url,
          "url" => "#{ENV['ROOT_URL']}/bloggers/#{entry.feed.blogger.slug}/entries/#{entry.slug}",
          "_self" => "#{ENV['ROOT_URL']}/bloggers/#{entry.feed.blogger.slug}/entries/#{entry.slug}.json",
          "school_session" => entry.session_slug,
          "blogger" =>  {
                          "name" => entry.feed.blogger.name,
                          "url" => "#{ENV['ROOT_URL']}/bloggers/#{entry.feed.blogger.slug}",
                          "_self" => "#{ENV['ROOT_URL']}/bloggers/#{entry.feed.blogger.slug}.json"
                        }
        }
      end
    }
  end
end