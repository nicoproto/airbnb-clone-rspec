require 'rails_helper'

feature "User logs in and logs out" do
  scenario "with correct details" do
    create(:user, email: "someone@example.tld", password: "somepassword")

    visit "/"

    click_link "Login"
    expect(page).to have_css("h2", text: "Log in")
    expect(current_path).to eq(new_user_session_path)

    login "someone@example.tld", "somepassword"

    expect(page).to have_css("h1", text: "Welcome")
    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully"

    find("#navbarDropdown").click
    click_link "Log out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully"
  end

  private

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end
end