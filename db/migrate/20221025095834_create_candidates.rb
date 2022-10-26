class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|

      t.timestamps
      t.string :name
      t.integer :w2_points
      t.integer :w3_points
      t.integer :w4_points
      t.integer :w5_points
      t.integer :w6_points
      t.integer :w7_points
      t.integer :w8_points
      t.integer :w9_points
      t.integer :w10_points
      t.integer :w11_points
      t.integer :w12_points
      t.integer :w13_points
      t.integer :w14_points
      t.integer :w15_points
      t.integer :w16_points
      t.integer :w17_points
      t.integer :w18_points
    end
  end
end
