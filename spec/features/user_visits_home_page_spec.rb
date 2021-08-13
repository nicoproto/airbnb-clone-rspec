require 'rails_helper'

feature "Home page" do
  scenario "visit" do
    visit "/"

    expect(page).to have_title "Chewing Dog"
    expect(page).to have_css "h1", text: "Welcome"
  end
end