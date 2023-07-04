class CardTransactionSerializer < ActiveModel::Serializer
  attributes :id, :category, :amount, :card_id, :created_at

  belongs_to :card
end
