class AddElectricEnergyToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :electric_energy, :float
  end
end
