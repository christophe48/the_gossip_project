require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get contactus" do
    get contact_contactus_url
    assert_response :success
  end

end
