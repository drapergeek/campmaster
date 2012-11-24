class Receipt < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :first_name, :last_name, :zip, presence: true

  def name
    [first_name, last_name].join(' ')
  end
end
