class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :blogger_id
      t.string :feed_xml
    end
  end
end
