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
  #  C = condiments/dressings
  #  CO = components (individual patty, etc.)
  
  #return any "solid" foods as categorized by me
  def self.all_solid_foods
    return where("food_class LIKE 'F%'")
  end
  
  #return distinct company names
  def self.distinct_company_names
    return find(:all, :select => "DISTINCT company_name")
  end
  
  #return top protein/cal ratio
  def self.top_protein_cal(num_in)
     self.all.sort_by {|a| a.p_100_ratio}.reverse.take(num_in)
  end
  
  #return top total protein
  def self.top_protein(num_in)
     self.all.sort_by {|a| a.protein}.reverse.take(num_in)
  end
  
  #protein/100cal ratio
  def p_100_ratio
    return (protein / (calories*1.0 / 100)).round(1)
  end
end
