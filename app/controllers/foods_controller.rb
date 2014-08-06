class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  has_scope :food_name, :protein

  # GET /foods
  def index    
  end
  
  def search    
    @extra_columns_list = get_column_names
    
    if params[:extra_columns]
      @extra_columns_selected = params[:extra_columns]
    else
      @extra_columns_selected = []
    end    
  
    #this block is for the user-filtered list
    if params[:company_list] #check if params are sent through
        @company_filter_list = params[:company_list][:list].reject!(&:empty?) #remove empty entries
      if  @company_filter_list.any?
        @filtered_foods = Food.all_solid_foods.companies(@company_filter_list)  
      end
            
    end
    
    if @filtered_foods #if we have a filtered list by company, use that
      @grid_foods = apply_scopes(@filtered_foods)
    else
      @grid_foods = apply_scopes(Food.all_solid_foods)
    end
    
  end

  # GET /foods/1
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render action: 'show', status: :created, location: @food }
      else
        format.html { render action: 'new' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:company_name, :food_name, :serving_size, :serving_units, :calories, :carbs, :fat, :protein, :cost)
    end
    
    def get_column_names
      return [['Carbs', 'carbs'],['Fats', 'fats']]
    end

end
