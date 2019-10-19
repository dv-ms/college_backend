# frozen_string_literal: true

require_relative 'call_backs'
class Section < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :department, autosave: true, class_name: 'Department', counter_cache: true, dependent: :destroy, touch: :departments_updated_at, validate: true, required: true
  has_and_belongs_to_many :teachers, association_foreign_key: :teacher_id, class_name: 'Teacher', foreign_key: :section_id, join_table: :sections_teachers, validate: true
  has_and_belongs_to_many :teachers # ,-> { where("experience>=?",0) }, -> { readonly }
  has_one :co_ordinator, class_name: 'Teacher', foreign_key: :id, autosave: false, validate: true
  has_many :subjects, through: :department
  has_many :students
  has_many :good_students, -> { where('percentage>80') }, class_name: 'Student'
  has_many :exams

  validates :department_id, :name, presence: true
  validates :name, format: { with: /[A-Z][A-Z]-2K\d\d/, message: 'Wrong section name pattern' }, length: { is: 7, wrong_length: 'Wrong length of section id, correct: 7' }

  after_destroy CallBacks
  around_save CallBacks
  around_update CallBacks
  around_create CallBacks
end
