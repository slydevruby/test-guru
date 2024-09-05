class RemoveRuleConstrainFromBadges < ActiveRecord::Migration[7.1]

  def up
    change_table :badges do |t|
      t.change_null :rule_id, false
      t.change_default :rule_id, nil
    end
  end

  def down
    change_table :badges do |t|
      t.change_null :rule_id, true
      t.change_default :rule_id, 1
    end
  end
end
