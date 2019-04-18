class AddSessionKeyToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :session_key, :string
  end
end
