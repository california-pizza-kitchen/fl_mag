class AddTwitterHandleToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :twitter_handle, :string
  end
end
