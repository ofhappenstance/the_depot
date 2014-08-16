require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    # verfifies a minimum of 4 a elements within id side which is stored wihitn id columns
    assert_select '#columns #side a', minimum: 4
    #  verfifies there are 3 elements wth class name entry
    assert_select '#main .entry', 3
    # verifies h3 element with given title
    assert_select 'h3', 'Programming Ruby 1.9'
    # verififes price is formatted properly
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
