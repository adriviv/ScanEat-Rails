class AddUserToPropositions < ActiveRecord::Migration[5.2]
  def change
    add_reference :propositions, :user, foreign_key: true
  end
end
