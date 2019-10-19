class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.text :name
      t.text :admin_username
      t.text :password

      t.timestamps
    end
  end
end
