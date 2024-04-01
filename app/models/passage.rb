# frozen_string_literal: true

class Passage < ApplicationRecord
  PASSAGE_MAX = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def completed?
    current_question.nil?
  end

  def current_no
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    save!
  end

  def grade
    100 * correct_questions / test.questions.count
  end

  def progress_width
    100.0 * current_no / test.questions.count
  end

  private

  def assign_first_question
    self.current_question = test.questions.first if test.present?
  end

  def assign_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_question
    if new_record?
      assign_first_question
    else
      assign_next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_count = correct_answers.count
    (correct_count == correct_answers.where(id: answer_ids).count) &&
      correct_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end
end
