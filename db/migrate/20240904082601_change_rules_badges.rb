class ChangeRulesBadges < ActiveRecord::Migration[7.1]
  def change

    remove_index :rules, :badge_id
    remove_foreign_key :rules, :badges
    remove_column :rules, :badge_id, :bigint

    add_reference :badges, :rule, null: false, foreign_key: true

  end
end
