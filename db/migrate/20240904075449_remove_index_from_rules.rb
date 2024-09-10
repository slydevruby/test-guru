# frozen_string_literal: true

class RemoveIndexFromRules < ActiveRecord::Migration[7.1]
  def change
    remove_index :rules, :category_id
  end
end
