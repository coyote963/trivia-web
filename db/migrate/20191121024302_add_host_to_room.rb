class AddHostToRoom < ActiveRecord::Migration[5.1]
  def change
    change_table(:rooms) do |t|
      t.references :host, foreign_key: { to_table: 'users'}
      t.references :guest, foreign_key: { to_table: 'users'}
    end
  end
end
