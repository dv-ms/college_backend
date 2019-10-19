class AddReferenceToTeachersAndStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :assigned, polymorphic:true
    add_reference :students, :assigned, polymorphic:true
  end
end
