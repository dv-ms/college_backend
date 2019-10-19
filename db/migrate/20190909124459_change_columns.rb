class ChangeColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :sections, :departments_id, :text
    change_column :sections, :teachers_id, :text
    change_column :students, :section_id, :text
    change_column :subjects, :department_id, :text
  end
end
