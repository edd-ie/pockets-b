class Card < ApplicationRecord
    belongs_to :user
    has_many :cardTransactions, dependent: :destroy
    has_many :saveCards, dependent: :destroy
    has_many :savings, through: :saveCards
end
