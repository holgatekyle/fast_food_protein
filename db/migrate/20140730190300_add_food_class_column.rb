class AddFoodClassColumn < ActiveRecord::Migration
  def change
    add_column :foods, :food_class, :string
  end
end
