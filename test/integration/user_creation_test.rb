require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "guest can create user account" do
    visit root_path
    click_on "Register Account"
    fill_in "user_email", with: "markmiranda51@gmail.com"
    fill_in "user_password", with: "password"

    click_on "Create Account"
    save_and_open_page
    assert page.has_content? "Account successfully created!"
    assert page.has_content? "Welcome, markmiranda51@gmail.com!"
  end

  test "guest cannot create user account without e-mail address" do
    visit new_user_path
    fill_in "user_password", with: "password"

    click_on "Create Account"

    assert page.has_content? "Email can't be blank"
  end

end
