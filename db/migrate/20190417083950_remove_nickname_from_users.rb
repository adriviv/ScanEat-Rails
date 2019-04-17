class RemoveNicknameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users , :nickname, :string
    remove_column :users , :avatar_url, :string
    remove_column :users , :city, :string
    remove_column :users , :province, :string

  end
end
