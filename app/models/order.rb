class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
end

def total_price
  price * quantity

end
