class AddExplanationToCarmaker < ActiveRecord::Migration[5.2]
  def change
    add_column :carmakers, :explanation, :text
  end
end
