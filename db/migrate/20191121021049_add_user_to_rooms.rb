class AddUserToRooms < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :rooms, :users, column: :host, primary_key: :id
    add_foreign_key :rooms, :users, column: :guest, primary_key: :id
  end
end
