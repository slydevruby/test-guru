class RemoveCategoryIdFromRules < ActiveRecord::Migration[7.1]
  def change
    remove_column :rules, :category_id, :bigint
  end
end
