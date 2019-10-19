class AddColumnToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :isAcademic, :boolean
  end
end
