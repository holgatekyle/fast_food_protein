class Food < ActiveRecord::Base
  scope :companies, lambda{|company_names| where("company_name IN (?)", company_names )}
  scope :food_name, lambda{|food_name| where('food_name LIKE ?', '%'+food_name+'%' )}
  scope :protein, lambda{|protein| where('protein >= ?', protein )}
  
  #food_class keys-
  #  FD = food dinner, most food types
  #  FB = food breakfast
  #  FDS = food salads
  #  FDI = foods sides
  #  D = drinks/liquids
  #  C = condiments
  
  def self.all_solid_foods
    return where("food_class LIKE 'F%'")
  end
  
  def self.distinct_company_names
    return find(:all, :select => "DISTINCT company_name")
  end
end
