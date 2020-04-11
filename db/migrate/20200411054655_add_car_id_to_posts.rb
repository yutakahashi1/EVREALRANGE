class AddCarIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :car, foreign_key: true
  end
end
