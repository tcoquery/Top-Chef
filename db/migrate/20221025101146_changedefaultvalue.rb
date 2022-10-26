class Changedefaultvalue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :candidates, :w2_points, 0
    change_column_default :candidates, :w3_points, 0
    change_column_default :candidates, :w4_points, 0
    change_column_default :candidates, :w5_points, 0
    change_column_default :candidates, :w6_points, 0
    change_column_default :candidates, :w7_points, 0
    change_column_default :candidates, :w8_points, 0
    change_column_default :candidates, :w9_points, 0
    change_column_default :candidates, :w10_points, 0
    change_column_default :candidates, :w11_points, 0
    change_column_default :candidates, :w12_points, 0
    change_column_default :candidates, :w13_points, 0
    change_column_default :candidates, :w14_points, 0
    change_column_default :candidates, :w15_points, 0
    change_column_default :candidates, :w16_points, 0
    change_column_default :candidates, :w17_points, 0
    change_column_default :candidates, :w18_points, 0
  end
end
