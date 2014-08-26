module FoodsHelper
  def normalize_column_name(name_in)
    if name_in == 'cholesterol'
      name_in = 'Chol'
    end
      return name_in.titleize
  end
end
