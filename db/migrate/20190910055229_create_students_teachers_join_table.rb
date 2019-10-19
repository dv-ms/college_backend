class CreateStudentsTeachersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :teachers do |join_table|
      join_table.index :student_id
      join_table.index :teacher_id
    end
  end
end
