class User < ApplicationRecord
    has_many :cards, dependent: :destroy
    has_many :sims, dependent: :destroy
    has_many :savings, dependent: :destroy
    has_many :SimTransactions, through: :sims
    has_many :CardTransactions, through: :cards
    has_many :saveSims, through: :savings
    has_many :saveCards, through: :savings
    has_secure_password


    validates :username, :email, :password, :password_confirmation, :subscription, presence: true
    validates :username, :email, uniqueness: true
    # validates :password, comparison: {equal_to: :password_confirmation}
    validates :subscription, inclusion: {in: ["basic", "premium"]}
end
