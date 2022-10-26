class Addcandidatestoteams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :candidate_one_id, :integer
    add_column :teams, :candidate_two_id, :integer
    add_column :teams, :candidate_three_id, :integer
  end
end
