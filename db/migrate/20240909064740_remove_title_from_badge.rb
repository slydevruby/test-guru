# frozen_string_literal: true

class RemoveTitleFromBadge < ActiveRecord::Migration[7.1]
  def change
    remove_column :badges, :title, :string
  end
end