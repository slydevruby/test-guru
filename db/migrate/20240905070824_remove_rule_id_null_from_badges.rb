class RemoveRuleIdNullFromBadges < ActiveRecord::Migration[7.1]
  def change
    change_column_null :badges, :rule_id, true
  end
end
