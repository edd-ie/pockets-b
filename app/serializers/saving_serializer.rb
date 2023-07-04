class SavingSerializer < ActiveModel::Serializer
  attributes :id, :description, :goal, :duration, :saved, :user_id

  belongs_to :user
end
