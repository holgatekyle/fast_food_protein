require 'spec_helper'

describe "foods/new" do
  before(:each) do
    assign(:food, stub_model(Food,
      :company_name => "MyString",
      :food_name => "MyString",
      :serving_size => "9.99",
      :serving_units => "MyString",
      :calories => "9.99",
      :carbs => "9.99",
      :fat => "9.99",
      :protein => "9.99",
      :cost => "9.99"
    ).as_new_record)
  end

  it "renders new food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", foods_path, "post" do
      assert_select "input#food_company_name[name=?]", "food[company_name]"
      assert_select "input#food_food_name[name=?]", "food[food_name]"
      assert_select "input#food_serving_size[name=?]", "food[serving_size]"
      assert_select "input#food_serving_units[name=?]", "food[serving_units]"
      assert_select "input#food_calories[name=?]", "food[calories]"
      assert_select "input#food_carbs[name=?]", "food[carbs]"
      assert_select "input#food_fat[name=?]", "food[fat]"
      assert_select "input#food_protein[name=?]", "food[protein]"
      assert_select "input#food_cost[name=?]", "food[cost]"
    end
  end
end
