require_relative 'call_backs'
class Teacher < ApplicationRecord
  belongs_to :department, optional: true, inverse_of: 'hod'
  has_and_belongs_to_many :sections
  belongs_to :section, optional: true, inverse_of: 'co_ordinator'
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :students
  has_many :assistant_teachers, class_name: 'Teacher', foreign_key: 'supervisor_id'#, ->{distinct}
  belongs_to :supervisor, class_name: 'Teacher', optional:true
  has_many :assignments, as: :assigned
  has_one :image, as: :image_profile

  validates  :name, :date_of_birth, :experience, presence:true
  validates :name, length:{maximun:30, minimum:2, too_long:"Name exceeds 30 chars", too_short:"Name less than 30 chars"}
  validates :date_of_birth, format:{with: /\d{4}-\d{2}-\d{2}/, message:"Invalid date pattern, required: yyyy-mm-dd"}, length:{is:10}
  validates :experience , numericality:{only_integer: true, greater_than_or_equal_to:0}

  after_destroy CallBacks
  around_save CallBacks
  around_update CallBacks
  around_create CallBacks
end
