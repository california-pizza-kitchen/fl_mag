class AddSlugToSchoolSession < ActiveRecord::Migration
  def change
    add_column :school_sessions, :slug, :string
  end
end
