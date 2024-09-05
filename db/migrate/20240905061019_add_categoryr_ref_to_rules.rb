class AddCategoryrRefToRules < ActiveRecord::Migration[7.1]
  def change
    add_reference :rules, :category, foreign_key: true, default: nil
  end
end
