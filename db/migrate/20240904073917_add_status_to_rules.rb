class AddStatusToRules < ActiveRecord::Migration[7.1]
  def change
    add_column :rules, :status, :string
  end
end
