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
end
