class Removecolumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :leagues, :user_id
  end
end
