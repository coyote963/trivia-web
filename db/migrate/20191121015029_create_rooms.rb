class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :category
      t.string :result
      t.boolean :isactive
      t.string :name

      t.timestamps
    end
  end
end
