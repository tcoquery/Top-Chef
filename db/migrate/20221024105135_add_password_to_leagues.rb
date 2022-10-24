class AddPasswordToLeagues < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :password, :string
  end
end
