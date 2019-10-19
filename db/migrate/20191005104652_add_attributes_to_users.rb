class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :new_att1, :string
    add_column :users, :new_att2, :integer
    add_column :users, :new_att3, :date
  end
end
