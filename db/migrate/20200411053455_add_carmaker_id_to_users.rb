class AddCarmakerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :carmaker, foreign_key: true
  end
end
