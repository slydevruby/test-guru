# frozen_string_literal: true

class AddLevelToRule < ActiveRecord::Migration[7.1]
  def change
    add_index :rules, :level, unique: true
  end
end
