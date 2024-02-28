class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validates_anwers

  private
  def validates_anwers
    errors.add(:answers) unless answers.size in 1..4
  end
  
end
