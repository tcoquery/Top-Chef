class CreateLeagueUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :league_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :league
    end
  end
end
