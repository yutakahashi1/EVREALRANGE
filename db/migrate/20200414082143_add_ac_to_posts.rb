class AddAcToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :AC, :string
    add_column :posts, :AC_temperature, :integer
  end
end
