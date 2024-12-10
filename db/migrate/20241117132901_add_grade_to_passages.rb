# frozen_string_literal: true

class AddGradeToPassages < ActiveRecord::Migration[7.1]
  def up
    add_column :passages, :grade, :decimal
  end

  def down
    remove_column :passages, :grade, :decimal
  end
end
