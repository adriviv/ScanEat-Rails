class AddProteinPercentageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :protein_percentage, :integer
  end
end
