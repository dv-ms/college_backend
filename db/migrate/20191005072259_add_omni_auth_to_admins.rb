class AddOmniAuthToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :provider, :string
    add_column :admins, :uid, :string
  end
end
