class CreateSubscriber < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string   :email
      t.string   :first_name
      t.string   :last_name
      t.boolean  :prospect?, :default => false

      t.timestamps
    end
  end
end



