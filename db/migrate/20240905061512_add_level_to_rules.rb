class AddLevelToRules < ActiveRecord::Migration[7.1]
  def change
    add_column :rules, :level, :integer
  end
end
