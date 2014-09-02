class Food < ActiveRecord::Base
  scope :companies, lambda{|company_names| where("company_name IN (?)", company_names )}
  scope :food_name, lambda{|food_name| where('lower(food_name) LIKE ?', '%'+food_name.downcase+'%' )}
  scope :protein, lambda{|protein| where('protein >= ?', protein )}
  scope :max_cals, lambda{|max_cals| where('calories <= ?', max_cals )}
  scope :max_carbs, lambda{|max_carbs| where('carbs <= ?', max_carbs )}
  scope :max_fat, lambda{|max_fat| where('fat <= ?', max_fat )}
  
  #food_class keys-
  #  FD = food dinner, most food types
  #  FB = food breakfast
  #  FDS = food salads
  #  FDI = foods sides
  #  D = drinks/liquids
  #  C = condiments/dressings
  #  CO = components (individual patty, etc.)
  
  #return any "solid" foods as categorized by me
  def self.all_solid_foods(show_breakfast)
    if show_breakfast
      return where("food_class LIKE 'F%'")
    else
      return where("food_class LIKE 'FD%'")
    end
  end
  
  #return distinct company names
  def self.distinct_company_names
     self.find(:all, :select => "DISTINCT company_name").sort_by!{|x| x.company_name}
  end
  
  def self.is_company?(c_name)
    !!Food.find_by_company_name(c_name)
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
    if calories == 0 and protein > 0
      return BigDecimal('Infinity')
    elsif calories == 0 and protein == 0
      return 0
    else
      return (protein / (calories*1.0 / 100)).round(1)
    end
  end
  
  #protein/fat ratio
  def p_f_ratio
    if fat == 0 and protein > 0
      return BigDecimal('Infinity')
    elsif fat == 0 and protein == 0
      return 0
    else
      return ApplicationController.helpers.fix_precision((protein / fat).round(2))
    end
  end
  
  #protein/carbs ratio
  def p_c_ratio
    if carbs == 0 and protein > 0
      return BigDecimal('Infinity')
    elsif carbs == 0 and protein == 0
      return 0
    else
      return ApplicationController.helpers.fix_precision((protein / carbs).round(2))
    end
  end
  
end
