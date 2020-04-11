class CreateCarmakers < ActiveRecord::Migration[5.2]
  def change
    create_table :carmakers do |t|
      t.string :maker, null: false
      t.text :image
      t.timestamps
    end
  end
end
