class Addstatustocandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :eliminated, :boolean
    change_column_default :candidates, :eliminated, false
  end
end
