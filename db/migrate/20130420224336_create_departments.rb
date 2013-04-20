class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :full_name
      t.string :abbreviation

      t.timestamps
    end
  end
end
