class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :subscription
  
  has_many :cards
  has_many :sims
  has_many :savings
end
