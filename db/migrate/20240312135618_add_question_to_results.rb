class AddQuestionToResults < ActiveRecord::Migration[7.1]
  def change
    add_column :results, :correct_questions, :integer
    add_reference :results, :current_question, null: false, 
      foreign_key: { to_table: :questions }, default: 0
  end
end
