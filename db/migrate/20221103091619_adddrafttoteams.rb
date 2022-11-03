class Adddrafttoteams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :draft_order, :integer 
    add_column :teams, :can_draft, :boolean 
    change_column_default :teams, :can_draft, false
  end
end
