# frozen_string_literal: true

class RemoveResultFromPassages < ActiveRecord::Migration[7.1]
  def up
    remove_column(:passages, :result, if_exists: true)
  end

  def down; end
end
