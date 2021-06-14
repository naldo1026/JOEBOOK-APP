class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user, null: true, foreign_key: true
    Comment.where(user_id: nil).each do |comment|
      comment.user_id = 1
      comment.save!
    end
    change_column_null(:comments, :user_id, false)
  end
end
