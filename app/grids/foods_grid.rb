class FoodsGrid
  include Datagrid

  scope do
    Food
  end
  
  filter(:company_name, :string)

  column(:company_name)
  column(:food_name)
  column(:serving_size) do |rec|
    rec.serving_size.to_s + " " + rec.serving_units
  end
  column(:calories)
  column(:protein)
  column(:carbs)
  column(:fat)
  column(:cost)
  
end
