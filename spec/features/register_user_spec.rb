require 'rails_helper'
feature "guest user creates an account" do
  scenario "successfully creates a new user account" do
    visit users_new_path
    fill_in "user[username]", with: "dfreidin"
    click_button "Sign In"
    expect(page).to have_content "Welcome dfreidin"
    expect(current_path).to eq(messages_path)
  end
  scenario "doesn't fill out username field" do
    visit users_new_path
    click_button "Sign In"
    expect(page).to have_content "Username can't be blank"
    expect(current_path).to eq(users_new_path)
  end
  scenario "fills in a username <= 5 characters" do
    visit users_new_path
    fill_in "user[username]", with: "short"
    click_button "Sign In"
    expect(page).to have_content "Username is too short"
    expect(current_path).to eq(users_new_path)
  end
end