# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :subject
  has_and_belongs_to_many :students
  has_one :department, through: :subject
  has_many :sections
end
