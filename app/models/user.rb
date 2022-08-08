class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many :api_keys, as: :bearer

  has_secure_password
end
