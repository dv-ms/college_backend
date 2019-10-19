class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.integer :password
      t.bigint :phone
      t.text :gender
      t.text :address
      t.date :date_of_birth
      t.text :image_path

      t.timestamps
    end
  end
end
