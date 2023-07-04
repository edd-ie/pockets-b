class SaveCardSerializer < ActiveModel::Serializer
  attributes :id, :goalName, :amount, :saving_id, :card_id
end
