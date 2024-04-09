# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :passages, dependent: :destroy
  has_many :users, through: :passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }

  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :beginner, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5...) }

  scope :category_by_title, lambda { |title|
    joins(:category)
      .where(categories: { title: })
      .order(title: :desc)
  }

  def self.categories_by_title(title)
    category_by_title(title).pluck(:title)
  end
end
