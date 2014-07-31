class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :company_name
      t.string :food_name
      t.decimal :serving_size
      t.string :serving_units
      t.decimal :calories
      t.decimal :carbs
      t.decimal :fat
      t.decimal :protein
      t.decimal :cost, precision: 5, scale: 2

      t.timestamps
    end
  end
end