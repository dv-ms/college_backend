class DeleteColumnsFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :admin_username
    remove_column :admins, :name
  end
end
