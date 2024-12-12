# frozen_string_literal: true

class AddTimeoutToTest < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :timeout, :integer, null: false, default: 0
  end
end
