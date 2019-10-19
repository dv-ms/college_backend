# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :image_profile, polymorphic: true
end
