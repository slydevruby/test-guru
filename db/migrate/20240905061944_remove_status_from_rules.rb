class RemoveStatusFromRules < ActiveRecord::Migration[7.1]
  def change
    remove_column :rules, :status, :string
  end
end
