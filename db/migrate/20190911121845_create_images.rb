class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :image_path
      t.integer :image_profile_id
      t.string :image_profile_type

      t.timestamps
    end
  end
end
