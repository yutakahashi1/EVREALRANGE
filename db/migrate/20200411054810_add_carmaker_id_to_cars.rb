class AddCarmakerIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :carmaker, foreign_key: true
  end
end
