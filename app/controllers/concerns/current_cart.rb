module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart 
      # get cart id from session object
      @cart = Cart.find(session[:cart_id])
    # if cart record not found 
    rescue ActiveRecord::RecordNotFound
      # create new cart
      @cart = Cart.create
      #  and store into session then return to new cart
      session[:cart_id] = @cart.id
    end
end
