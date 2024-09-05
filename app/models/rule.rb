# frozen_string_literal: true

class Rule < ApplicationRecord
  has_one :badge

  belongs_to :category, optional: true
  belongs_to :test, optional: true

  validates :title, presence: true, uniqueness: true

end
