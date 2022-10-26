class Addcandidatetoteams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :candidate_four_id, :integer
  end
end
