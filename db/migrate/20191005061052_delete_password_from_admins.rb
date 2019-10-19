class DeletePasswordFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :password

  end
end
