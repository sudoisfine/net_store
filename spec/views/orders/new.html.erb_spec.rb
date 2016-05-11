require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :name => "MyString",
      :address => "MyText",
      :pay_type => "MyString",
      :user => nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_name[name=?]", "order[name]"

      assert_select "textarea#order_address[name=?]", "order[address]"

      assert_select "input#order_pay_type[name=?]", "order[pay_type]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"
    end
  end
end
