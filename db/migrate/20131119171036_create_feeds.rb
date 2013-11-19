class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :blogger_id
      t.string :feed_xml
      t.string :feed_url
    end
  end
end
