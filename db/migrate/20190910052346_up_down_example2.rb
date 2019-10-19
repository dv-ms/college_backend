class UpDownExample2 < ActiveRecord::Migration[5.2]
  def change
    reversible do |direction|
      direction.up{rename_table :departments, :new_departments
      say "reanamed table departments to new_departments"}
      direction.down{rename_table :new_departments, :departments}


      direction.up{rename_column :departments, :name, :new_name
      say "reanamed departments name to new_name"}
      direction.down{rename_column :departments, :new_name, :name}


      direction.up {add_column :subjects, :sample_column, :text
      say "Added sample_column to subjects"}
      direction.down{remove_column :subjects, :sample_column, :text}

      direction.up{add_index :students, :id
      say "Added index id to students"}
      direction.down{remove_index :students, :id}


      direction.up{add_reference :departments, :subjects, name: "Reference_to_subjects"
      say "Added add_reference departments to subjects"}
      direction.down{remove_reference :departments, :subjects, name:"Reference_to_subjects"}



      direction.up{change_column_null :departments, :name, true
      say "changed departments name null to true"}
      direction.down{change_column_null :departments, :name, false}


      direction.up{change_column_default :departments, :name, from: "" ,to: "Default name"
      say "Changed departments name default value"}


      direction.up{add_column :departments, :new_column, :decimal, precision:10,scale:4, limit:10, comment: "New column at migration", null:true, default: 25,polymorphic:true
      say "Added new column to departments"}
      direction.down{remove_column :departments, :new_column }


      # direction.up{add_foreign_key :sections, :departments, name: "fk_sections"}
      # direction.down{remove_foreign_key :sections, :departments, name: "fk_sections"}

      direction.up{create_table :new_table do |t|
        t.text :name
        t.timestamps end
      say "Created new Table"}
      direction.down{drop_table :new_table}
    end
  end
end
