require 'test_helper'

class AuteurControllerTest < ActionDispatch::IntegrationTest
  test "should get content" do
    get auteur_content_url
    assert_response :success
  end

end
