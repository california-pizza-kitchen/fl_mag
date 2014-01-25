class CreateSchoolSessions < ActiveRecord::Migration
  def change
    create_table :school_sessions do |t|
      t.string :name

      t.timestamps
    end
  end
end
