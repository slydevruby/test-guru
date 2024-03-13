# frozen_string_literal: true

class Passage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answers_ids)
    if correct_answer?
      self.correct_questions += 1
    end
    self.current_question = next
    save
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    correct_answers.count == correct_answers.where(id: answer_ids).count
  end
end
