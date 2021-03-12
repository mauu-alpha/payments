class User < ApplicationRecord
  has_secure_password

  has_many :orders, inverse_of: :user
end
