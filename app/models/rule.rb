# frozen_string_literal: true

class Rule < ApplicationRecord
  has_one :badge

  VALID_STATUSES = ['category', 'test', 'level']

  validates :title, presence: true, uniqueness: true

  validates :status, inclusion: { in: VALID_STATUSES }

end
