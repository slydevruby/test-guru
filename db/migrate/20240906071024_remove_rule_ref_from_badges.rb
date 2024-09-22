# frozen_string_literal: true

class RemoveRuleRefFromBadges < ActiveRecord::Migration[7.1]
  def change
    remove_reference :badges, :rule, foreign_key: true
  end
end
