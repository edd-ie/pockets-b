class SimTransactionSerializer < ActiveModel::Serializer
  attributes :id, :category, :amount, :sim_id

  belongs_to :sim
end
