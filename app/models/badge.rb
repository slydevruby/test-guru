# frozen_string_literal: true

class Badge < ApplicationRecord
  enum :rule, %i[category test level]

  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
end
