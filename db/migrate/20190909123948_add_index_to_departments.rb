class AddIndexToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :hod_id, :text
    add_index :departments, :hod_id
  end
end
