class FoodsController < ApplicationController
  has_scope :food_name, :protein
  before_filter :init_vars

  # GET /foods
  def index
    @home_page = true
  end
  
  def search    
 
    #this block is for the user-filtered list
    if params[:company_list] #check if params are sent through
        @company_filter_list = params[:company_list][:list].reject!(&:empty?) #remove empty entries
      if  @company_filter_list.any?
        @filtered_foods = Food.all_solid_foods(@show_breakfast).companies(@company_filter_list)  
      end   
    end
    
    if @filtered_foods #if we have a filtered list by company, use that
      @grid_foods = apply_scopes(@filtered_foods)
    else
      @grid_foods = apply_scopes(Food.all_solid_foods(@show_breakfast))
    end
    
  end
  
  def restaurant
   if params[:company_name]
      @company_name = params[:company_name][0]
      redirect_to("/r/"+@company_name)
   else
     @company_name ||= params[:id]
   end  
    
    if !Food.is_company?(@company_name)
      redirect_to(root_path)
    end
    
    @grid_foods = Food.all_solid_foods(@show_breakfast).companies(@company_name)
    
  end

  private
  
    def init_vars
      @home_page = false
      @extra_columns_selected = []
      @show_breakfast = false
      
      if params[:breakfast] == "1"
        @show_breakfast = true
      end
    end

    def get_column_names
      return [['Carbs', 'carbs'],['Fats', 'fats']]
    end

end
