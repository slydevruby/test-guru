# frozen_string_literal: true

class ChangeCorrectColumnPassages < ActiveRecord::Migration[7.1]
  def up
    change_column_default(:passages, :correct_questions, 0)
  end

  def down; end
end
