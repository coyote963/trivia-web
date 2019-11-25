class AddNullToRooms < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:questions, :problem, false)
    change_column_null(:questions, :category, false)
    change_column_null(:questions, :correct_answer, false)
    change_column_null(:questions, :incorrect_answer_one, false)
    change_column_null(:questions, :incorrect_answer_two, false)
    change_column_null(:questions, :incorrect_answer_three, false)
  end
end
