# frozen_string_literal: true

class ChangeCorrectColumnPassages < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:passages, :correct_questions, 0)
  end
end
