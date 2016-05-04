require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :price => "9.99",
      :quantity => 1,
      :description => "MyText",
      :brand_id => "MyString",
      :category_id => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_quantity[name=?]", "product[quantity]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "input#product_brand_id[name=?]", "product[brand_id]"

      assert_select "input#product_category_id[name=?]", "product[category_id]"
    end
  end
end
