class Tag < ActiveRecord::Base
  has_many :entries_tags

  before_save :slugify!

  def slugify!
    self.slug = self.word.downcase.gsub(/[\W,\s]/,'-')
  end

  def display_word_or_word
    self.display_word != nil ? self.display_word : self.word
  end

end