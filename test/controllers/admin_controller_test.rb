require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  setup do
    User.create :username => "admin", :password => "password", :password_confirmation => "password"
  end

  test "should get index" do
    get admin_url, headers: {'HTTP_AUTHORIZATION' => login("admin", "password") }
    assert_response :success    
  end

  
  private
    def login(username, password)
      credentials = ActionController::HttpAuthentication::Basic.encode_credentials username, password
    end
  
end
