# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :assigned, polymorphic: true
end
