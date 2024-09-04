class RemoveTestDoneFromRules < ActiveRecord::Migration[7.1]
  def change
    remove_column :rules, :tests_done, :integer
    remove_foreign_key :rules, :categories
  end
end
