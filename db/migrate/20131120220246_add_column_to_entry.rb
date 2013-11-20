class AddColumnToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :added?, :boolean, :default => false
  end
end
