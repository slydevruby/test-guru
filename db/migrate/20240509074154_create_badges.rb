# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
