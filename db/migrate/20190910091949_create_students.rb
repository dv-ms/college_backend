class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.text :name
      t.date :date_of_birth
      t.integer :year
      t.references :section, index: true

      t.timestamps
    end
  end
end
