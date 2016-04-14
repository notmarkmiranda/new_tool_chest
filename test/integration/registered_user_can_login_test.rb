require 'test_helper'

class RegisteredUserCanLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(email: "markmiranda51@gmail.com", password: "password")
    # ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit login_path


    fill_in "E-Mail Address", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"
    assert page.has_content? "Successfully Logged In!"
    assert page.has_content? "Welcome, markmiranda51@gmail.com!"
  end

end
