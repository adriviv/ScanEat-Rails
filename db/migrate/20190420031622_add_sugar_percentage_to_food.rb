class AddSugarPercentageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :sugar_percentage, :integer
  end
end
