class AddTestRefToRules < ActiveRecord::Migration[7.1]
  def change
    add_reference :rules, :test, foreign_key: true, default: nil
  end
end
