class AddIngredientsToPropositions < ActiveRecord::Migration[5.2]
  def change
    add_column :propositions, :ingredients, :string
  end
end
