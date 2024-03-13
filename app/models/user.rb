# frozen_string_literal: true

class User < ApplicationRecord
  has_many :passages
  has_many :tests, through: :passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
