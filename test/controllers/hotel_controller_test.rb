require "test_helper"

class HotelControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get hotel_name:string_url
    assert_response :success
  end

  test "should get address:string" do
    get hotel_address:string_url
    assert_response :success
  end

  test "should get contact_number:integer" do
    get hotel_contact_number:integer_url
    assert_response :success
  end

  test "should get eamil:string" do
    get hotel_eamil:string_url
    assert_response :success
  end
end
