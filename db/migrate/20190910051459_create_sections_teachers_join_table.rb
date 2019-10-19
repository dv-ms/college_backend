class CreateSectionsTeachersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sections, :teachers do |join_table|
      join_table.index :section_id
      join_table.index :teacher_id
    end
  end
end
