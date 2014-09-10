class FoodsController < ApplicationController
  has_scope :food_name, :protein, :max_cals, :max_carbs, :max_fat
  before_filter :init_vars

  # GET /foods
  def index
  end
  
  def search    
    @extra_columns_list = get_column_names
    
    if params[:extra_columns]
      @extra_columns_selected = params[:extra_columns]
    end    
    
    if params[:search]
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
  end
  
  def restaurant
   if params[:company_name]
      @company_name = params[:company_name][0]
   else
     @company_name ||= params[:id]
   end
   
    @extra_columns_list = get_column_names
    
    if params[:extra_columns]
      @extra_columns_selected = params[:extra_columns]
    end
    
    if !Food.is_company?(@company_name)
      redirect_to(root_path)
    end
    
    @grid_foods = apply_scopes(Food.all_solid_foods(@show_breakfast).companies(@company_name))
    
  end
  
  def amazon
    
  end
  
  def about
    
  end

  private
  
    def init_vars
      @extra_columns_selected = []
      @show_breakfast = false
      @show_pc = false
      @show_pf = false
      @show_cf = false
      
      if params[:sort]
        @sort_by = params[:sort]
      else
        @sort_by = 3
      end
      
      if params[:breakfast] == "1"
        @show_breakfast = true
      end
      
      if params[:ptoc] == "1"
        @show_pc = true
      end
      
      if params[:ptof] == "1"
        @show_pf = true
      end
      
      if params[:ctof] == "1"
        @show_cf = true
      end
      
      @amazon_list = [{ food_name: 'Power Crunch Bars - Cookies and Creme', calories: 205, fat: 12, protein: 14, carbs: 10, url: 'http://www.amazon.com/gp/product/B000FRSSFC/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B000FRSSFC&linkCode=as2&tag=fasfoopro-20&linkId=MO4MZBR2JB2HQYHN' },
                      { food_name: 'Optimum Nutrition Whey Gold Standard', calories: 120, fat: 1, protein: 24, carbs: 2, url: 'http://www.amazon.com/gp/product/B000QSNYGI/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B000QSNYGI&linkCode=as2&tag=fasfoopro-20&linkId=XQKJZSU2P4V2PIXU' },
                      { food_name: 'Seapoint Farms Dry Roasted Edamame', calories: 130, fat: 4, protein: 14, carbs: 10, url: 'http://www.amazon.com/gp/product/B000G2UUOS/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B000G2UUOS&linkCode=as2&tag=fasfoopro-20&linkId=KAZK2GOF4YRDPH3I' },
                      { food_name: 'Nutiva Organic Hemp Protein', calories: 80, fat: 4, protein: 11, carbs: 12, url: 'http://www.amazon.com/gp/product/B0012C2GFM/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0012C2GFM&linkCode=as2&tag=fasfoopro-20&linkId=ECCVBKQIDVC7Q3I4' },
                      { food_name: 'Kellogg''s Special K Cereal', calories: 120, fat: 1, protein: 10, carbs: 19, url: 'http://www.amazon.com/gp/product/B00CL52KQY/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00CL52KQY&linkCode=as2&tag=fasfoopro-20&linkId=THRSM46WRQAW2FZG' },
                      { food_name: 'Bell Plantation Powdered Peanut Butter', calories: 45, fat: 1.5, protein: 5, carbs: 5, url: 'http://www.amazon.com/gp/product/B009E7YBEQ/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B009E7YBEQ&linkCode=as2&tag=fasfoopro-20&linkId=DU4KCR3XCX5DEXCR' },
                      { food_name: 'Jack Link''s Beef Jerky', calories: 80, fat: 1, protein: 15, carbs: 3, url: 'http://www.amazon.com/gp/product/B002OG1NUO/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B002OG1NUO&linkCode=as2&tag=fasfoopro-20&linkId=6KUWWRUGSFUGT664' },
                      { food_name: 'Turkey Perky Jerky', calories: 50, fat: 0, protein: 9, carbs: 2, url: 'http://www.amazon.com/gp/product/B006OD008Y/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B006OD008Y&linkCode=as2&tag=fasfoopro-20&linkId=JUK6XW4VPFEASRUJ' },
                      { food_name: 'Bumble Bee Wild Pink Salmon, Skinless & Boneless', calories: 60, fat: 1.5, protein: 14, carbs: 0, url: 'http://www.amazon.com/gp/product/B0025ULK66/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0025ULK66&linkCode=as2&tag=fasfoopro-20&linkId=SLCQ2H6CD62C6VKD' },
                      { food_name: 'Promax LS Lower Sugar Protein Bar', calories: 220, fat: 6, protein: 18, carbs: 33, fiber: 14, sugar: 9, cholesterol: 5, sodium: 240, url: 'http://www.amazon.com/gp/product/B004JRQ3DS/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B004JRQ3DS&linkCode=as2&tag=fasfoopro-20&linkId=5UE37OZ7RKNGVGQM' },
                      {  food_name: 'Body Fortress Whey Protein Powder', calories: 170, fat: 2.5, protein: 30, carbs: 7, fiber: 0, sugar: 2, cholesterol: 85, sodium: 70, url: 'http://www.amazon.com/gp/product/B001G8Y948/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B001G8Y948&linkCode=as2&tag=fasfoopro-20&linkId=OBU735TQJP2IIYZM' },
                      {  food_name: 'CytoSport Muscle Milk Lean Protein Powder', calories: 150, fat: 6, protein: 16, carbs: 9, fiber: 2, sugar: 2, cholesterol: 10, sodium: 85, url: 'http://www.amazon.com/gp/product/B0015QSW4O/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0015QSW4O&linkCode=as2&tag=fasfoopro-20&linkId=JGYVBFJMIMJLXPEY' },
                      {  food_name: 'CytoSport Muscle Milk Ready-to-Drink Shake', calories: 230, fat: 9, protein: 25, carbs: 12, fiber: 2, sugar: 3, cholesterol: 10, sodium: 430, url: 'http://www.amazon.com/gp/product/B002DUD7I2/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B002DUD7I2&linkCode=as2&tag=fasfoopro-20&linkId=GCVAMUOGDFBSPQB5' }
                      
                      ]
  
      @top_3_amazon = [{food_name: 'Quest Nutrition Protein Bar', img: 'qb.png', url: 'http://www.amazon.com/gp/product/B00I0DI0Z6/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00I0DI0Z6&linkCode=as2&tag=ffp-amazon-top3-20&linkId=TXVHB3WQDQCHJWOC'},
                       {food_name: 'Optimum Nutrition Whey Gold Standard', img: 'onwhey.png', url: 'http://www.amazon.com/gp/product/B000QSNYGI/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B000QSNYGI&linkCode=as2&tag=ffp-amazon-top3-20&linkId=PQUMGE32I7G2WET6'},
                       {food_name: 'CytoSport Muscle Milk Lean Protein Powder', img: 'mm.png', url: 'http://www.amazon.com/gp/product/B0015QSW4O/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0015QSW4O&linkCode=as2&tag=ffp-amazon-top3-20&linkId=CKVALDK4C7PQERA4'}
                      ]
    end

    def get_column_names
      return [['Fiber', 'fiber'],['Sugars', 'sugars'],['Cholesterol', 'cholesterol'],['Sodium', 'sodium'],['Saturated Fat', 'sat_fat'],['Trans Fat', 'trans_fat']]
    end

end
