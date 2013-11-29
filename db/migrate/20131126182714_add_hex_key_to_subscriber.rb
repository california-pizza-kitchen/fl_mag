class AddHexKeyToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :hex_key, :string
  end
end
