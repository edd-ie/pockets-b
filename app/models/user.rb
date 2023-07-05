class User < ApplicationRecord
    has_many :cards, dependent: :destroy
    has_many :sims, dependent: :destroy
    has_many :savings, dependent: :destroy
    has_many :simTransactions, through: :sims
    has_many :cardTransactions, through: :cards
    has_many :saveSims, through: :savings
    has_many :saveCards, through: :savings
    has_secure_password


    validates :username, :email, :password, :password_confirmation, :subscription, presence: true
    validates :username, :email, uniqueness: true
    # validates :password, comparison: {equal_to: :password_confirmation}
    validates :subscription, inclusion: {in: ["basic", "premium"]}

    def simData
        categories = ['food', 'clothes', 'electronics', 'household', 'other', 'transport', 'health', 'education', 'entertainment']
        dataset = []
        categories.each{|x|
            values = 0
            accumulator = self.simTransactions.where(category: x).each{|y| values+=y[:amount]}
            dataset.push({x=>values})
        }
        dataset
    end
    
    def cardData
        categories = ['food', 'clothes', 'electronics', 'household', 'other', 'transport', 'health', 'education', 'entertainment']
        dataset = []
        categories.each{|x|
            values = 0
            accumulator = self.cardTransactions.where(category: x).each{|y| values+=y[:amount]}
            dataset.push({x=>values})
        }
        dataset
    end

    def topSimAction
        self.simTransactions.order(amount: :desc).limit(10)
    end

    def topCardAction
        self.cardTransactions.order(amount: :desc).limit(10)
    end

    def userSims
        self.sims
    end
end
