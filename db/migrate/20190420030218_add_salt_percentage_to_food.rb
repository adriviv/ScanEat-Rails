class AddSaltPercentageToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :salt_percentage, :integer
  end
end
