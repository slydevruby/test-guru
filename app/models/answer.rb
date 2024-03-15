# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validates_answers

  scope :correct, -> { where(correct: true) }

  private

  def validates_answers
    errors.add(:answer_count, 'must be less 4') if question.answers.count >= 4
  end
end
