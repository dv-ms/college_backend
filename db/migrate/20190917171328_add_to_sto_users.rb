class AddToStoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accepted_tos, :boolean
  end
end
