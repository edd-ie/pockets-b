class SavingSerializer < ActiveModel::Serializer
  attributes :id, :description, :goal, :duration, :saved, :user_id
end
