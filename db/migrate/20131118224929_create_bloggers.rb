class CreateBloggers < ActiveRecord::Migration
  def change
    create_table :bloggers do |t|
      t.string :name
      t.string :feed_xml
      t.integer :semester

      t.timestamps
    end
  end
end
