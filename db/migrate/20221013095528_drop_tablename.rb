class DropTablename < ActiveRecord::Migration[7.0]
  def change
    drop_table :league_users
  end
end
