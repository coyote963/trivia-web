class MakeGuestNullableRooms < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:rooms, :guest_id, true)
  end
end
