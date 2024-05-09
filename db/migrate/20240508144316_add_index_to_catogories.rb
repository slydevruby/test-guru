# frozen_string_literal: true

class AddIndexToCatogories < ActiveRecord::Migration[7.1]
  def change
    add_index :categories, :title
  end
end
