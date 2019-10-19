class AddReferenceToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :supervisor
  end
end
