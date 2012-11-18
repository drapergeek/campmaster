require 'spec_helper'

feature 'user management' do
  scenario 'view all users' do
    sign_in_as_admin
    users = create_users
    visit users_path
    verify_page_shows_information_for(users)
  end

  scenario 'invited user accepts invitation' do
    sign_in_as_admin
    create_user_invitation
    sign_out
    register_new_user_from_invitation
    ensure_new_user_is_signed_in
  end

  def ensure_new_user_is_signed_in
    page.should have_content("You are now signed in")
  end

  def register_new_user_from_invitation
    email = open_email("newuser@example.com")
    click_email_link_matching(/invitation/)
    fill_in 'Password', with: 'example'
    fill_in 'Password confirmation', with: 'example'
    click_button "Set my password"
  end

  def create_user_invitation
    click_link "Users"
    click_link "Invite New User"
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: 'newuser@example.com'
    fill_in "Role", with: "registration"
    click_button "Send an invitation"
  end

  def create_users
    users = []
    users << user1 = create(:user, email: 'myuser@example.com', role: 'registration')
    users << create(:user, email: 'anotheruser@example.com', role: 'admin')
  end

  def verify_page_shows_information_for(users)
    users.each do |user|
      page.should have_content user.email
      page.should have_content user.role
      page.should have_content user.name
    end
  end
end
