module FoodsHelper
  def normalize_column_name(name_in)
    if name_in == 'cholesterol'
      name_in = 'Chol'
    end
      return name_in.titleize
  end
  
  def fix_precision(num_in)
      return number_with_precision(num_in, strip_insignificant_zeros: true)
  end
end
