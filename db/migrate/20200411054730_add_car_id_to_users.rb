class AddCarIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :car, foreign_key: true
  end
end
