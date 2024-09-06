# frozen_string_literal: true

class Rule < ApplicationRecord
  belongs_to :badge, optional: true
  belongs_to :category, optional: true
  belongs_to :test, optional: true

  validates :title, presence: true, uniqueness: true

end
