class ChangeColumnsToInt < ActiveRecord::Migration
  def change
    change_table :foods do |t|
      t.change :serving_size, :text
      t.change :calories, :integer
      t.change :carbs, :integer
      t.change :fat, :integer
      t.change :protein, :integer
      t.change :cals_from_fat, :integer
      t.change :total_fat_pct, :integer
      t.change :sat_fat_g, :integer
      t.change :sat_fat_pct, :integer
      t.change :trans_fat, :integer
      t.change :cholesterol, :integer
      t.change :chol_pct, :integer
      t.change :sodium, :integer
      t.change :sodium_pct, :integer
      t.change :carbs_pct, :integer
      t.change :fiber, :integer
      t.change :fiber_pct, :integer
      t.change :sugars, :integer
      t.change :vit_a, :integer
      t.change :vit_c, :integer
      t.change :calcium, :integer
      t.change :iron, :integer
      
    end
  end
end
