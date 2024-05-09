# frozen_string_literal: true

class Rule < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, uniqueness: true
end
