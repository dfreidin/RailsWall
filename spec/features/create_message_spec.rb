require 'rails_helper'
feature "user creates a message" do
  before(:each) do
    visit users_new_path
    fill_in "user[username]", with: "dfreidin"
    click_button "Sign In"
  end
  scenario "successfully creates a message" do
    new_message = (0..15).map { (65+rand(26)).chr }.join
    fill_in "message[message]", with: new_message
    click_button "Post a Message"
    expect(page).to have_content new_message
    expect(current_path).to eq(messages_path)
  end
  scenario "doesn't fill out message field" do
    click_button "Post a Message"
    expect(page).to have_content "Message can't be blank"
    expect(current_path).to eq(messages_path)
  end
  scenario "tries to create a message that is <= 10 characters" do
    fill_in "message[message]", with: "too short"
    click_button "Post a Message"
    expect(page).to have_content "Message is too short"
    expect(current_path).to eq(messages_path)
  end
end