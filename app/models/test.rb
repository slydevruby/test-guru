class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  validates :title, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validates_uniqueness_of :title, scope: :level

  scope :beginner, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5... ) }

  scope :category_by_title, -> (title) { joins(:category)
    .where(categories: {title: title})
    .order(title: :desc)
  }

end
