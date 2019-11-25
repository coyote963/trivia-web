class AddUserToSelection < ActiveRecord::Migration[5.1]
  def change
    add_reference :selections, :user, foreign_key: true
    add_reference :selections, :question, foreign_key: true
  end
end
