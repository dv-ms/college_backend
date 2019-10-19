class RemoveColumnTeachersIdFromDepartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :departments, :teachers_id
  end
end
