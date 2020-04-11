class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.string :temperature, null: false
      t.string :weather, null: false
      t.string :driving_status, null: false
      t.string :driving_mode, null: false
      t.integer :distance, null: false
      t.integer :consumption, null: false
      t.text :image
      t.text :text
      t.timestamps
    end
  end
end
