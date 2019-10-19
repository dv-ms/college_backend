class AddMarksColumnToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :percentage, :integer
  end
end
