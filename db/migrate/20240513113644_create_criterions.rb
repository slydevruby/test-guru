class CreateCriterions < ActiveRecord::Migration[7.1]
  def change
    create_table :criterions do |t|
      t.string :title

      t.timestamps
    end
  end
end
