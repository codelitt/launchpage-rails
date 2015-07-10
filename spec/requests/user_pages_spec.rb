require 'rails_helper'

feature "User pages" do

  scenario "signup page" do
    visit new_user_path
    expect(page).to have_title 'Project X'
  end
end
