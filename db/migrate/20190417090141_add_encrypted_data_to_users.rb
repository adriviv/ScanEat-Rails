class AddEncryptedDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encryptedData, :string
  end
end
