# frozen_string_literal: true

class CreateRules < ActiveRecord::Migration[7.1]
  def change
    create_table :rules do |t|
      t.string :title, null: false
      t.integer :tests_done, default: 0, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
