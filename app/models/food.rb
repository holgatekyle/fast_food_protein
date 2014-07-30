class Food < ActiveRecord::Base
  scope :companies, lambda{|company_names| where("company_name IN (?)", company_names )}
  scope :food_name, lambda{|food_name| where('food_name LIKE ?', '%'+food_name+'%' )}
  scope :protein, lambda{|protein| where('protein >= ?', protein )}
end
