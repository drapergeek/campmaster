require 'spec_helper'

feature 'basic run' do
  scenario 'load the home page' do
    visit root_path
    page.should have_content 'Sign in'
  end
end
