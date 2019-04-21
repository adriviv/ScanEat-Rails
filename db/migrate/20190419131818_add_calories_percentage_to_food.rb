class AddCaloriesPercentageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :calories_percentage, :integer
  end
end
