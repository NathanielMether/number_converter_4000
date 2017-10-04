require 'test_helper'

class NumberConverterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get number_converter_index_url
    assert_response :success
  end

end
