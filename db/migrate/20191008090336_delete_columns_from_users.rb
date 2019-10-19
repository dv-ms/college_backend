class DeleteColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password
    remove_column :users, :image_path
  end
end
