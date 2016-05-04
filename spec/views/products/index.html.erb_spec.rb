require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :price => "9.99",
        :quantity => 1,
        :description => "MyText",
        :brand_id => "Brand",
        :category_id => "Category"
      ),
      Product.create!(
        :name => "Name",
        :price => "9.99",
        :quantity => 1,
        :description => "MyText",
        :brand_id => "Brand",
        :category_id => "Category"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
