class SimTransactionSerializer < ActiveModel::Serializer
  attributes :id, :category, :amount, :card_id
end
