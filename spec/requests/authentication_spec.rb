require 'spec_helper'

feature 'user login required' do
  scenario 'not authenticated user tries to visit home page' do
    visit root_path
    page.should have_content "You need to sign in"
  end

  scenario 'registered user logs in and visits home page' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    page.should have_content 'Signed in'

    visit root_path
    page.should_not have_content 'You need to sign in'
  end
end
