require 'spec_helper'

describe "foods/index" do
  before(:each) do
    assign(:foods, [
      stub_model(Food,
        :company_name => "Company Name",
        :food_name => "Food Name",
        :serving_size => "9.99",
        :serving_units => "Serving Units",
        :calories => "9.99",
        :carbs => "9.99",
        :fat => "9.99",
        :protein => "9.99",
        :cost => "9.99"
      ),
      stub_model(Food,
        :company_name => "Company Name",
        :food_name => "Food Name",
        :serving_size => "9.99",
        :serving_units => "Serving Units",
        :calories => "9.99",
        :carbs => "9.99",
        :fat => "9.99",
        :protein => "9.99",
        :cost => "9.99"
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Food Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Serving Units".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
