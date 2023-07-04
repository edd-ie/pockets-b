class SaveSimSerializer < ActiveModel::Serializer
  attributes :id, :goalName, :amount, :saving_id, :sim_id

  belongs_to :saving
  belongs_to :sim
end
