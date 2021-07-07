class CreateCovers < ActiveRecord::Migration[6.0]
  def change
    create_table :covers do |t|
      t.string :store_name
      t.string :date_of_shift
      t.string :time_of_shift
      t.text :descrption

      t.timestamps
    end
  end
end
