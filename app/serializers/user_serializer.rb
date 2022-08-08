class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  has_many :api_keys
end
