class AddStartDateToSchoolSession < ActiveRecord::Migration
  def change
    add_column :school_sessions, :start_date, :date
  end
end
