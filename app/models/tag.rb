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
end