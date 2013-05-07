class RemoveDepartmentFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :department, :string
  end
end
