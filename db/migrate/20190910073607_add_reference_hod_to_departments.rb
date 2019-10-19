class AddReferenceHodToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :hod
  end
end
