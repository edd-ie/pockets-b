class SimTransactionSerializer < ActiveModel::Serializer
  attributes :id, :category, :amount, :sim_id, :created_at

  belongs_to :sim
end
