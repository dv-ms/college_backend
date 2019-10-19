# frozen_string_literal: true

require_relative 'call_backs'
class Department < ApplicationRecord
  # attributes: id, name, hod_id
  # associations
  has_many :sections, autosave: true, counter_cache: true, dependent: :destroy, before_add: :check_section, after_add: :greet, before_remove: :confirm, after_remove: :notify # ,-> { distinct }
  has_one :hod, class_name: 'Teacher', foreign_key: :id, autosave: false, validate: true
  has_many :subjects, -> { order('id asc').limit(100) } # , ->{distinct}
  has_many :students, -> { group 'sections.id' }, through: :sections # , ->{distinct}
  has_many :performing_sections, ->(_d) { where }, class_name: 'Section'
  has_many :exams, through: :subjects

  # validations
  validates :name, presence: true, confirmation: { accept: true, message: "Doesn't match confirmation" }
  validates :name, uniqueness: true, length: { maximum: 30, minimun: 6, too_long: 'Maximum department name length is 30', too_short: 'Minimum department name length is 6' }

  # callbacks
  # after_destroy CallBacks
  # around_update CallBacks
  # around_create CallBacks

  private

  def check_section(section); end

  def greet(section); end

  def confirm(section); end

  def notify(section); end
end
