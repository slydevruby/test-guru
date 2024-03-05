# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validates_answers

  scope :right, -> { where(correct: true) }

  private

  def validates_answers
    errors.add(:answers) if question.answers.count >= 4
  end
end
