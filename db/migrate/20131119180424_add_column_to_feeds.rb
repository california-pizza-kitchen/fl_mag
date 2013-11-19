class AddColumnToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :last_modified, :time
    add_column :feeds, :etag, :integer
  end
end
