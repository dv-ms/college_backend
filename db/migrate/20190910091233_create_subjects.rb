class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.text :name
      t.integer :year
      t.text :type
      t.references :department, index:true

      t.timestamps
    end
  end
end
