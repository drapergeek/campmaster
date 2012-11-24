require 'spec_helper'

feature 'View receipts' do
  background do
    sign_in_as_receipt_entry
  end

  scenario 'view list of all receipts' do
    receipt1 = create(:receipt, first_name: "Peter", last_name: "Parker")
    receipt2 = create(:receipt, first_name: "Bruce", last_name: "Wayne")

    click_link "Receipts"

    page.should have_content receipt1.name
    page.should have_content receipt2.name
  end

  scenario 'more than 25 receipts in the system' do
    first_receipt = create(:receipt, first_name: "First", last_name: "Receipt")
    create_list(:receipt, 25)

    click_link "Receipts"
    page.should_not have_content first_receipt.name

    click_link "Next >"
    page.should have_content first_receipt.name
  end

  scenario 'view an individual receipt' do
    receipt = create(:full_receipt)
    click_link "Receipts"
    within "tr#receipt-#{receipt.id}" do
      click_link "View"
    end
    verify_page_has_all_receipt_information(receipt)
  end

  def verify_page_has_all_receipt_information(receipt)
    page.should have_content receipt.name
    page.should have_content receipt.email
    page.should have_content receipt.phone
    page.should have_content receipt.address
    page.should have_content receipt.city
    page.should have_content receipt.state
    page.should have_content receipt.zip
  end
end
