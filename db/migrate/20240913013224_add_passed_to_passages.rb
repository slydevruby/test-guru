# frozen_string_literal: true

class AddPassedToPassages < ActiveRecord::Migration[7.1]
  def change
    add_column :passages, :grade, :float, default: 0
  end
end
