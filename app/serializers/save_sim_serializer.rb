class SaveSimSerializer < ActiveModel::Serializer
  attributes :id, :goalName, :amount, :saving_id, :sim_id
end
