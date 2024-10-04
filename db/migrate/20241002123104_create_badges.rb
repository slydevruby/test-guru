# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.text :url

      t.integer :rule, default: 0
      t.integer :parameter, default: 0

      t.timestamps
    end
  end
end
