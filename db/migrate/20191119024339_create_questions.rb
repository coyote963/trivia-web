class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :problem
      t.string :category
      t.string :correct_answer
      t.string :incorrect_answer_one
      t.string :incorrect_answer_two
      t.string :incorrect_answer_three

      t.timestamps
    end
  end
end
