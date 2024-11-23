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
  scope :by_test, ->(test) { joins(:test).where(test:) }
  scope :by_category_title, lambda { |title|
    joins(test: :category).where(category: { title: })
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

  def give_award(user)
    Badge.all.each do |badge|
      create_award(badge, user) if assign_level?(badge,
                                                 user) || assign_test?(badge, user) || assign_category?(badge, user)
    end
  end

  private

  def assign_category?(badge, user)
    return false if badge.rule != 'category'

    category = Category.find(badge.parameter)
    Passage.by_category_title(category.title).passed.by_user(user).count ==
      Test.by_category(category).count
  end

  def assign_test?(badge, user)
    return false if badge.rule != 'test'

    (badge.parameter == test.id) &&
      (Passage.passed.by_user(user).by_test(badge.parameter).count == 1)
  end

  def assign_level?(badge, user)
    return false if badge.rule != 'level'
    return false if badge.parameter != test.level

    (Test.by_level(badge.parameter).count ==
       Passage.by_user(user).by_level(badge.parameter).passed.count)
  end

  def create_award(badge, user)
    if Award.exists?({ badge:, user: })
      Award.find_by({ badge:, user:  }).increment!(:count)
    else
      Award.create!(user:, badge:, count: 1)
    end
  end

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
