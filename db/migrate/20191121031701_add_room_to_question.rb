class AddRoomToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :room, foreign_key: true
  end
end
