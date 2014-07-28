class Food < ActiveRecord::Base
  scope :company_name, lambda{|company_name| where('company_name = ?', company_name )}
  

end
