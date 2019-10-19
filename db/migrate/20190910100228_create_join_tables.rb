class CreateJoinTables < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teachers, :sections do |jt|
      jt.index :teacher_id
      jt.index :section_id
    end
    create_join_table :teachers, :subjects do |jt|
      jt.index :teacher_id
      jt.index :subject_id
    end
  end
end
