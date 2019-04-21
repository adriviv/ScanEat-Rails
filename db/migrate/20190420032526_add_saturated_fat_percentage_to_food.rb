class AddSaturatedFatPercentageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :saturated_fat_percentage, :integer
  end
end
