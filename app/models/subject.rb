require_relative 'call_backs'
class Subject < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :department, required: true, validate: true, autosave: true, counter_cache: true, dependent: :destroy, inverse_of: :subjects, touch: :departments_updated_at
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :students
  has_one :exam

  after_destroy CallBacks
  around_save CallBacks
  around_update CallBacks
  around_create CallBacks
end
