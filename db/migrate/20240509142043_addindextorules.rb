# frozen_string_literal: true

class Addindextorules < ActiveRecord::Migration[7.1]
  def change
    add_index :rules, :title, unique: true
  end
end
