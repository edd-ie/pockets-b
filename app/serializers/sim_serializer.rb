class SimSerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :user_id

  belongs_to :user
  has_many :simTransactions
end
