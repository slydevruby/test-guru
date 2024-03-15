# frozen_string_literal: true

class AddQuestionToResults < ActiveRecord::Migration[7.1]
  def change
    add_column :passages, :correct_questions, :integer
    add_reference :passages, :current_question, foreign_key: { to_table: :questions }
  end
end
