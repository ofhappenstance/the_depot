class StoreController < ApplicationController
  def index
    # display product titles in alphabetical order 
    @products = Product.order(:title)
  end
end
