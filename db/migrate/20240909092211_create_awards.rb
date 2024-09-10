class CreateAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :awards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rule, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
