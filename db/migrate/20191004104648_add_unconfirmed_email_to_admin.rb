class AddUnconfirmedEmailToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :unconfirmed_email, :string
  end
end
