class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  devise :invitable, :database_authenticatable, :recoverable, :rememberable

  validates :name, presence: true
  validates :role, presence: true
end
