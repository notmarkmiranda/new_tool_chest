require 'test_helper'

class RegisteredUserCanLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(email: "markmiranda51@gmail.com", password: "password")
    
  end
end
