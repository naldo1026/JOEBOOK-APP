class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :position
      t.string :store_name
      t.text :story

      t.timestamps
    end
  end
end
