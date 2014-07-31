class UpdateFoodColumns < ActiveRecord::Migration
  def change
    remove_column :foods, :serving_units
    add_column :foods, :cals_from_fat, :decimal
    add_column :foods, :total_fat_pct, :decimal  
    add_column :foods, :sat_fat_g, :decimal  
    add_column :foods, :sat_fat_pct, :decimal  
    add_column :foods, :trans_fat, :decimal  
    add_column :foods, :cholesterol, :decimal  
    add_column :foods, :chol_pct, :decimal  
    add_column :foods, :sodium, :decimal  
    add_column :foods, :sodium_pct, :decimal  
    add_column :foods, :carbs_pct, :decimal  
    add_column :foods, :fiber, :decimal  
    add_column :foods, :fiber_pct, :decimal  
    add_column :foods, :sugars, :decimal  
    add_column :foods, :vit_a, :decimal  
    add_column :foods, :vit_c, :decimal  
    add_column :foods, :calcium, :decimal  
    add_column :foods, :iron, :decimal  
  end
end
