class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :subscription
end
