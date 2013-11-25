class AddColumnToEntriesTag < ActiveRecord::Migration
  def change
    add_column :entries_tags, :visible, :boolean, :default => false
  end
end
