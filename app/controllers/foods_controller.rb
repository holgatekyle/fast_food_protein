class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
    
    #sort by protein, then reverse to get descending, then take the "top 3"
    @most_protein_top_3 = @foods.sort_by {|a| a["protein"]}.reverse.take(3)
    @most_protein_cal_top_3 = @foods.sort_by {|a| a["protein"]/a["calories"]}.reverse.take(3)
    @most_protein_dollar_top_3 = @foods.sort_by {|a| a["protein"]/a["cost"]}.reverse.take(3)
    
    @foods_grid = FoodsGrid.new(params[:foods_grid]) do |scope|
      scope.page(params[:page]).per_page(10)
    end
  end

  # GET /foods/1
  # GET /foods/1.json
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
  # POST /foods.json
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
  # PATCH/PUT /foods/1.json
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
  # DELETE /foods/1.json
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
