# frozen_string_literal: true

class Badge < ApplicationRecord
  belongs_to :rule

  has_one_attached :image, dependent: :destroy
end
