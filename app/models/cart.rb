class Cart < ActiveRecord::Base
  # existence of line items is dependent on the existence of the cart, 
  # any dependents will be destroyed if cart is deleted
  has_many :line_items, dependent: :destroy
end
