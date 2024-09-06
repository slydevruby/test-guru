class AddBadgeRefToRules < ActiveRecord::Migration[7.1]
  def change
    add_reference :rules, :badge, foreign_key: true, default: nil
  end
end
