class AddHodToDepartment < ActiveRecord::Migration[5.2]
  def change
    change_column :departments, :teachers_id, :text
  end
end
