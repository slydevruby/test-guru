# frozen_string_literal: true

class Badge < ApplicationRecord
  validates :title, presence: true
end
