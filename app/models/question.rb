class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validates_anwers

  private

  def validates_answers
    errors.add(:answers) if (answers.count < 1) || (answers.count > 4)
  end
end
