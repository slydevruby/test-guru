class AddBadgeToRules < ActiveRecord::Migration[7.1]
  def change
    add_reference :rules, :badge, null: false, foreign_key: true
  end
end
