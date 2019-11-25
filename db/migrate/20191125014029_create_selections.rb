class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections do |t|
      t.boolean :iscorrect
      t.timestamps
    end
  end
end
