class SaveCardSerializer < ActiveModel::Serializer
  attributes :id, :goalName, :amount, :saving_id, :card_id

  belongs_to :saving
  belongs_to :card
end
