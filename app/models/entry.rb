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

  def safe_html(html)
    Sanitize.clean(html,
      {:remove_contents => true}
      #:elements => %w[
      #   a abbr b blockquote br cite code dd dfn dl dt em i kbd mark ol p pre
      #   q s figcaption table samp small strike strong sub sup time u var td tr div figure span
      # ],
      # :attributes => {
      #   :all => ['class']
      # }
      )

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
        first + "<p>" + second if first && second
      else
        "<p>" + self.content + "</p>"
      end
    end
  end

  def keyword_filter(keyword)
    skips = ["&", "<", ">", "quo", "p", "code", "project", "=", "[", "]", "\"", " ", "'"]
    return true if skips.collect do |skip|
      keyword.include?(skip)
    end.uniq.include?(true)
  end

  def keywords
    # acts_as_taggable_on
    skippables = ["&rsquo", "<", ">", "ldquo", "code", "project"]
    extractor = Phrasie::Extractor.new
    rough_tags = extractor.phrases(self.content, strength: 2, occur: 5)
    rough_tags.collect do |tag|
      next if keyword_filter(tag[0])
      tag[0]
    end.reject(&:nil?)
  end

  def self.sort_by_date_published(collection)
    collection.sort_by{|entry| entry.published}.reverse
  end

  def self.featured_entries
    self.where(:added? => true).sort_by{ |entry| entry.mag_published }
  end

  def create_tag(word)
    tag = Tag.find_or_create_by(:word => word)
    entry_tag = self.entries_tags.build(:tag_id => tag.id)
    entry_tag.save
  end

end