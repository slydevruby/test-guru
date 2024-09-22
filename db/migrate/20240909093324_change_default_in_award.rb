# frozen_string_literal: true

class ChangeDefaultInAward < ActiveRecord::Migration[7.1]
  def change
    change_column_default :awards, :count, 0
  end
end
