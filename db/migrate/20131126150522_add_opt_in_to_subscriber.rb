class AddOptInToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :opt_in?, :boolean, default: true
  end
end
