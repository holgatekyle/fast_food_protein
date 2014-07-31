class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  has_scope :food_name, :protein

  # GET /foods
  def index    
  end
  
  def search    
    @all_foods = Food.all_solid_foods

    if params[:company_list] #check if params are sent through
        @company_filter_list = params[:company_list][:list].reject!(&:empty?) #remove empty entries
      if  @company_filter_list.any?
        @filtered_foods = @all_foods.companies(@company_filter_list)  
      end
            
    end
    
    if @filtered_foods #if we have a filtered list by company, use that
      @grid_foods = apply_scopes(@filtered_foods)
    else
      @grid_foods = apply_scopes(@all_foods)
    end
    
    #sort by protein, then reverse to get descending, then take the "top 3"
    @most_protein_top_3 = @all_foods.sort_by {|a| a["protein"]}.reverse.take(3)
    #multiple by 1.0 or it won't divide how we want it, SQLite issue
    @most_protein_cal_top_3 = @all_foods.sort_by {|a| (a["protein"]*1.0)/a["calories"]}.reverse.take(3)
    
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

end
