class Sim < ApplicationRecord
    belongs_to :user
    has_many :simTransactions, dependent: :destroy
    has_many :saveSims, dependent: :destroy
end
