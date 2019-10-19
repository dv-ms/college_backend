class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.text :name
      t.belongs_to :department, index: true
      t.references :co_ordinator, index: true

      t.timestamps
    end
    # rename_column :sections ,:teacher_id, :co_ordinator_id
  end
end
