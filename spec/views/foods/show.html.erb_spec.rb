require 'spec_helper'

describe "foods/show" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :company_name => "Company Name",
      :food_name => "Food Name",
      :serving_size => "9.99",
      :serving_units => "Serving Units",
      :calories => "9.99",
      :carbs => "9.99",
      :fat => "9.99",
      :protein => "9.99",
      :cost => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    rendered.should match(/Food Name/)
    rendered.should match(/9.99/)
    rendered.should match(/Serving Units/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
