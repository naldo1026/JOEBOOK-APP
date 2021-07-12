class AddUserToCovers < ActiveRecord::Migration[6.0]
  def change
    add_reference :covers, :user, null: true, foreign_key: true
  end
end
