class AddSchoolSessionsToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :school_session_id, :integer
  end
end
