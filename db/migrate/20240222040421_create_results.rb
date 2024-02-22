class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.integer :result
      t.boolean :passed, null: false
      t.references :test, null: false, foreign_key: { to_table: :tests }
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
