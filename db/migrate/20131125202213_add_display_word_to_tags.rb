class AddDisplayWordToTags < ActiveRecord::Migration
  def change
    add_column :tags, :display_word, :string
  end
end
