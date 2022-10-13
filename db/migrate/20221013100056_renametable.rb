class Renametable < ActiveRecord::Migration[7.0]
  def change
    rename_table :league_users, :leagues_users
  end
end
