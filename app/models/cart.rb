class Cart < ActiveRecord::Base
  # existence of line items is dependent on the existence of the cart, 
  # any dependents will be destroyed if cart is deleted
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    # checks whether list of items include the product we're adding 
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum{ |item| item.total_price }
  end
end
