class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :car_type
      t.text :image
      t.float :WLTP_range
      t.float :EPA_range
      t.timestamps
    end
  end
end
