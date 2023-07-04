class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :user_id

  belongs_to :user
  has_many :cardTransactions
end
