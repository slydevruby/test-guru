# frozen_string_literal: true

class Rule < ApplicationRecord
  has_one :badge, dependent: :destroy, inverse_of: :rule
  # has_one :award, dependent: :destroy

  belongs_to :category, optional: true
  belongs_to :test, optional: true

  accepts_nested_attributes_for :badge, allow_destroy: true

  validates :title, presence: true, uniqueness: true
end