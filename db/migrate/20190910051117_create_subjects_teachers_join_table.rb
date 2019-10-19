class CreateSubjectsTeachersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teachers, :subjects, id:false do |joint_table|
      joint_table.index :teacher_id
      joint_table.index :subject_id
    end
  end
end
