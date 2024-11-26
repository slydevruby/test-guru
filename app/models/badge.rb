# frozen_string_literal: true

class Badge < ApplicationRecord
  enum :rule, %i[category test level]

  belongs_to :user, optional: true

  validates :url, presence: true
end
