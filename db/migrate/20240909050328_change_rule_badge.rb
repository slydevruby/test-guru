# frozen_string_literal: true

class ChangeRuleBadge < ActiveRecord::Migration[7.1]
  def change
    remove_reference :rules, :badge, foreign_key: true
    add_reference :badges, :rule, foreign_key: true
  end
end
