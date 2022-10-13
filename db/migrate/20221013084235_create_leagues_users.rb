class CreateLeaguesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues_users do |t|
      t.integer :user_id
      t.integer :league_id

      t.timestamps
    end
  end
end
