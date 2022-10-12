class Changetables < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :admin_id, :integer
    add_column :teams, :league_id, :integer
    rename_column :teams, :member_id, :user_id
  end
end
