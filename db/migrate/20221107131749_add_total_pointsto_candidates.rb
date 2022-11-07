class AddTotalPointstoCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :total_points, :integer
    change_column_default :candidates, :total_points, from: nil, to: 0
  end
end
