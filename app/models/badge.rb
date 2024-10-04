# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users

  default_scope { order(title: :asc) }

  validates :title, presence: true
  validates :url, presence: true

  enum :rule, %i[category test level]
end
