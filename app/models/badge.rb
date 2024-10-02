# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :users
end
