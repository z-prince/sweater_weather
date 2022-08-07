class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  has_many :api_keys, as: :bearer

  has_secure_password
end
