class SavingSerializer < ActiveModel::Serializer
  attributes :id, :name, :goal, :duration, :saved_amount, :user_id

  belongs_to :user
  has_many :saveCards
  has_many :saveSims
end
