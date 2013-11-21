class AddColumnToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :slug, :string
  end
end
