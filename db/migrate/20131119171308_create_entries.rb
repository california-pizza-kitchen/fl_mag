class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.string :author
      t.text :summary
      t.text :content
      t.datetime :published
      t.datetime :mag_published

    end
  end
end
