module Helpers
  module Request
    module SignIn
      def sign_in_as(user)
        visit root_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'
      end

      def sign_in_as_admin
        sign_in_as(create(:admin_user))
      end

      def sign_in_as_receipt_entry
        sign_in_as(create(:receipt_entry_user))
      end

      def sign_out
        click_link "Sign out"
      end
    end
  end
end

RSpec.configure do |config|
  config.include Helpers::Request::SignIn, type: :request
end
