# frozen_string_literal: true

class Passage < ApplicationRecord
  PASSAGE_MAX = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question
  before_save :calc_grade

  scope :passed, -> { where('grade > ? ', PASSAGE_MAX) }
  scope :by_user, ->(user) { where(user:) }
  scope :by_category_name, lambda { |name|
    joins(test: :category).where(category: { title: name })
  }
  scope :by_level, ->(level) { Passage.joins(:test).where(test: { level: }) }

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

  def progress_width
    100.0 * current_no / test.questions.count
  end

  private

  def calc_grade
    self.grade = 100 * correct_questions / test.questions.count
  end

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
