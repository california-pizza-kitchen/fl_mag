class Entry < ActiveRecord::Base
  include APIQueryable

  belongs_to :feed
  belongs_to :blogger
  belongs_to :school_session
  has_many :entries_tags
  has_many :tags, through: :entries_tags

  before_save :slugify!

  def slugify!
    self.title != nil ? self.slug = self.title.downcase.gsub(/[\W,\s]/,'-') : self.slug = self.id
  end

  def assign_school_session
    if self.feed.blogger.school_session
      update :school_session => self.feed.blogger.school_session
    end
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

  def session
    self.feed.blogger.school_session_or_placeholder
  end

  def session_slug
    self.feed.blogger.school_session_slug_or_placeholder
  end

  def self.no_session_count
    where(:school_session_id => nil).count
  end

  def twitter_handle
    self.feed.blogger.twitter_handle
  end

  def tags_added
    Tag.joins(:entries_tags).where(:entries_tags => {:visible => true, :entry_id => self.id})
  end

  def safe_html(html)
    Sanitize.clean(html, {:remove_contents => true})
  end

  def publish
    self.update(:added? => true, :mag_published => Time.now)
    return true
  end

  def unpublish
    self.update(:added? => false, :mag_published => nil)
    return true
  end

  def summarize
    if self.content
      if self.content.include?("<p>")
        first = self.content.split("<p>")[1]
        second = self.content.split("<p>")[2]
        first = safe_html(first)
        second = safe_html(second)
        first = first + "</p>" if first && !first.end_with?("</p>")
        second = second + "</p>" if second && !second.end_with?("</p>")
        "<p>" + first + "<p>" + second if first && second
      else
        "<p>" + self.content + "</p>"
      end
    end
  end

  # skip.match(/[^a-zA-Z]/).nil?

  def get_tags
    extractor = Phrasie::Extractor.new
    rough_tags = extractor.phrases(self.content, strength: 3, occur: 3)
    rough_tags.each do |tag|
      next if !!tag[0].match(/[^a-zA-Z]/)
      next if tag[0].length < 3
      tag = Tag.where(:word => tag[0].downcase.gsub(' ','')).first_or_create
      EntriesTag.create(:entry_id => self.id, :tag_id => tag.id) if tag.ignore != nil && tag.ignore != true
    end
    self.get_title_tags if self.title != nil
  end

  def get_title_tags
    # binding.pry
    rough_tags = self.title.split(" ")
    rough_tags.each do |tag|
      next if !!tag.match(/[^a-zA-Z]/) || tag.length < 3
      # next if tag.length < 3
      tag = Tag.where(:word => tag.downcase.gsub(' ','')).first_or_create
      next if EntriesTag.where(:entry_id => self.id, :tag_id => tag.id).count > 0
      EntriesTag.create(:entry_id => self.id, :tag_id => tag.id) if tag.ignore != true
    end
  end

  def make_all_tags_visible
    self.entries_tags.each do |entry_tag|
      entry_tag.update(visible: true)
    end
  end

  def self.featured_by_date_published
    self.where(:added? => true).order('mag_published DESC')
  end

  def self.featured_entries
    self.where(:added? => true)
  end

  def self.collect_by_tag(tag_id)
    self.joins(:entries_tags).where(:entries_tags => {:tag_id => tag_id, :visible => true } ).order("mag_published DESC")
  end

  def self.collect_by_school_session(school_session_id)
    self.where(:school_session_id => school_session_id)
  end

  def self.collect_unassigned
    self.where(:school_session_id => nil)
  end

  # API

  def self.default_order
    'published DESC'
  end

  def as_json_concise
    {
      "title" => self.title,
      "published_date" => self.published,
      "slug" => self.slug,
      "school_session" => self.session_slug
    }
  end

  def as_json_verbose
    {
      "title" => self.title,
      "blog_url" => self.url,
      "url" => "#{ENV['ROOT_URL']}/bloggers/#{self.feed.blogger.slug}/entries/#{self.slug}",
      "_self" => "#{ENV['API_ROOT']}/bloggers/#{self.feed.blogger.slug}/entries/#{self.slug}",
      "school_session" => self.session_slug,
      "published_date" => self.published,
      "slug" => self.slug,
      "blogger" =>  {
                      "name" => self.feed.blogger.name,
                      "url" => "#{ENV['ROOT_URL']}/bloggers/#{self.feed.blogger.slug}",
                      "_self" => "#{ENV['API_ROOT']}/bloggers/#{self.feed.blogger.slug}"
                    },
      "content" => self.content.html_safe,
      "tags" => self.tags.collect do |tag|
        {
          "tag" => tag.word,
          "url" => "#{ENV['ROOT_URL']}/tags/#{tag.slug}",
          "_self" => "#{ENV['API_ROOT']}/tags/#{tag.slug}"
        }
      end
    }
  end
end