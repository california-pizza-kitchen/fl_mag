class AddSchoolSessionToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :school_session_id, :integer
  end
end
