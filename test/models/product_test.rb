require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    # create new product
    product = Product.new(title: "book title",
                          description: "yyy",
                          image_url: "zzz.jpg")
    # if product price is -1 or 0, should produce error message and be invalid
    product.price= -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    #if product price is 1, we assert that model is now valid 
    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title:       "My Book Title",
                description: "yyy",
                price:       1,
                image_url:   image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    # rather than test each of 9 cases above, we make two loops. one to check cases expected to be valid(ok array), 
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    # other for cases invalid (bad array)
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end


end