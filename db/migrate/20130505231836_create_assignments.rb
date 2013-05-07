class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.string :band
      t.date :start_date
      t.string :length
      t.integer :department_id
      t.integer :user_id
      t.string :department
      t.string :manager

      t.timestamps
    end
    add_index :assignments, [:department_id, :created_at]
  end
end
