class AddNullToQuestions < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:rooms, :isactive, false)
    change_column_null(:rooms, :name, false)
    change_column_null(:rooms, :host_id, false)
  end
end
