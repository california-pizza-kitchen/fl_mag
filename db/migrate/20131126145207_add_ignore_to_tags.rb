class AddIgnoreToTags < ActiveRecord::Migration
  def change
    add_column :tags, :ignore, :boolean, :default => false
  end
end
