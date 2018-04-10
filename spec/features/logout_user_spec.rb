require 'rails_helper'
feature "user logs out" do
  scenario "successfully logs out" do
    visit users_new_path
    fill_in "user[username]", with: "dfreidin"
    click_button "Sign In"
    click_link "Logout"
    expect(current_path).to eq(users_new_path)
  end
end