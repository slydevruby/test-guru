# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :passages, dependent: :destroy
  has_many :users, through: :passages, dependent: :destroy
  has_many :tests, through: :passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }

  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :timeout, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :beginner, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5...) }
  scope :by_level, ->(level) { where(level:) }
  scope :by_category, ->(category) { where(category:) }

  scope :category_by_title, lambda { |title|
    joins(:category)
      .where(categories: { title: })
      .order(title: :desc)
  }

  def self.categories_by_title(title)
    category_by_title(title).pluck(:title)
  end

  def self.get_count_correct_answers(category)
    joins(:category).where(category:).joins(questions: :answers).where(answers: { correct: true }).count
  end
end
