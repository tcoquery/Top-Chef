class RenameLeagueUser < ActiveRecord::Migration[7.0]
  def change
    rename_table :leagues_users, :league_users 
  end
end
