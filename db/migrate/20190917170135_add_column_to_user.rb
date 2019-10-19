class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :text
    add_column :users, :state, :text
    add_column :users, :country, :text
  end
end
