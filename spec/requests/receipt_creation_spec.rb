require 'spec_helper'

feature 'user creates a receipt' do
  background do
    sign_in_as_receipt_entry
  end

  scenario 'new receipt with only required fields' do
    click_link "Receipts"
    click_link "Add New Receipt"
    receipt = create(:receipt)
    fill_in_required_fields_with_information(receipt)
    verify_flash_for_receipt(receipt)
    verify_last_receipt_matches_required_fields(receipt)
  end

  scenario 'new receipt with all fields' do
    visit new_receipt_path
    receipt = create(:full_receipt)
    fill_in_all_fields_with_information(receipt)
    verify_flash_for_receipt(receipt)
    verify_last_receipt_matches_all_fields(receipt)
  end

  scenario 'new receipt missing required fields' do
    visit new_receipt_path
    fill_in 'First name', with: 'Tony'
    click_button 'Create Receipt'
    page.should have_content 'Please check for errors in your receipt'
  end

  def fill_in_all_fields_with_information(receipt)
    fill_in 'First name', with: receipt.first_name
    fill_in 'Last name', with: receipt.last_name
    fill_in 'Email', with: receipt.email
    fill_in 'Phone', with: receipt.phone
    fill_in 'Address', with: receipt.address
    fill_in 'City', with: receipt.city
    select receipt.state, from: 'State'
    fill_in 'Zip', with: receipt.zip
    click_button 'Create Receipt'
  end

  def fill_in_required_fields_with_information(receipt)
    fill_in 'First name', with: receipt.first_name
    fill_in 'Last name', with: receipt.last_name
    fill_in 'Zip', with: receipt.zip
    click_button 'Create Receipt'
  end

  def verify_flash_for_receipt(receipt)
    page.should have_content "Created receipt for #{receipt.name}"
  end

  def verify_redirected_to_new_recipt_page
    page.should have_content 'New Receipt'
  end

  def verify_last_receipt_matches_required_fields(receipt)
    last_receipt = Receipt.last
    last_receipt.first_name.should == receipt.first_name
    last_receipt.last_name.should == receipt.last_name
    last_receipt.zip.should == receipt.zip
  end

  def verify_last_receipt_matches_all_fields(receipt)
    last_receipt = Receipt.last
    last_receipt.first_name.should == receipt.first_name
    last_receipt.last_name.should == receipt.last_name
    last_receipt.email.should == receipt.email
    last_receipt.phone.should == receipt.phone
    last_receipt.address.should == receipt.address
    last_receipt.city.should == receipt.city
    last_receipt.state.should == receipt.state
    last_receipt.zip.should == receipt.zip
  end
end
