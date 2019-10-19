# frozen_string_literal: true

require_relative 'call_backs'
class Student < ApplicationRecord
  belongs_to :section, ->(s) { where (s.year = year) }, class_name: 'Section' # , ->{ includes :department } , -> { readonly }
  has_one :department, through: :section
  has_and_belongs_to_many :subjects
  has_many :teachers, through: :section
  has_many :assignments, as: :assigned
  has_and_belongs_to_many :exams
  has_one :image, as: :image_profile

  after_destroy CallBacks
  around_save CallBacks
  around_update CallBacks
  around_create CallBacks
end
