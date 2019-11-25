class AddFieldsToSelection < ActiveRecord::Migration[5.1]
  def change
    add_column :selections, :answer, :string
    add_column :selections, :iscorrect, :boolean
  end
end
