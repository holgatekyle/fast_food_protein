json.array!(@foods) do |food|
  json.extract! food, :id, :company_name, :food_name, :serving_size, :serving_units, :calories, :carbs, :fat, :protein, :cost
  json.url food_url(food, format: :json)
end
