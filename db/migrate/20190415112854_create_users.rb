class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar_url
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
