class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_secure_password

  before_create do
    self[:api_key] = create_key
  end

  def create_key
    SecureRandom.hex(13)
  end
end
