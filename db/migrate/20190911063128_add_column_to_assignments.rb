class AddColumnToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :assigned_id, :bigint
    add_column :assignments, :assigned_type, :string
  end
end
