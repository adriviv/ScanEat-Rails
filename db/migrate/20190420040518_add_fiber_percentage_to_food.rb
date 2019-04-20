class AddFiberPercentageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :fiber_percentage, :integer
  end
end
