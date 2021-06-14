class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, null: true, foreign_key: true
    Post.where(user_id: nil).each do |post|
      post.user_id = 1
      post.save!
    end
    change_column_null(:posts, :user_id, false)
  end
end
