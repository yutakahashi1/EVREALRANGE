class AddCarmakerIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :carmaker, foreign_key: true
  end
end
