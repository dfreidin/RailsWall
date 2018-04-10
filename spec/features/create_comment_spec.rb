require 'rails_helper'
feature "user creates a message" do
  before(:each) do
    visit users_new_path
    fill_in "user[username]", with: "dfreidin"
    click_button "Sign In"
    new_message = (0..15).map { (65+rand(26)).chr }.join
    fill_in "message[message]", with: new_message
    click_button "Post a Message"
  end
  scenario "successfully creates a comment" do
    new_comment = (0..15).map { (65+rand(26)).chr }.join
    fill_in "comment[comment]", with: new_comment
    click_button "Post a Comment"
    expect(page).to have_content new_comment
    expect(current_path).to eq(messages_path)
  end
  scenario "doesn't fill out comment field" do
    click_button "Post a Comment"
    expect(page).to have_content "Comment can't be blank"
    expect(current_path).to eq(messages_path)
  end
  scenario "tries to create a comment that is <= 10 characters" do
    fill_in "comment[comment]", with: "too short"
    click_button "Post a Comment"
    expect(page).to have_content "Comment is too short"
    expect(current_path).to eq(messages_path)
  end
end