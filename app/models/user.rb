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

    def userCards
        self.cards
    end

    def simUse
        self.simTransactions.order(created_at: :desc).limit(10).map { |record| {id: record.id, category: record.category, amount: record.amount, sim_id: record.sim_id, created_at: record.created_at.strftime("%d/%b")}}
    end

    def userSimBal
        balance = 0
        self.sims.each{|z| balance+=z.balance}
        [{id:self.id, username: self.username, balance:balance, sub:self.subscription}]
    end

    def userCardBal
        balance = 0
        self.cards.each{|z| balance+=z.balance}
        [{id:self.id, username: self.username, balance:balance, sub:self.subscription}]
    end

    def cardUse
        self.cardTransactions.order(created_at: :desc).limit(10).map { |record| {id: record.id, category: 
            record.category, amount: record.amount, card_id: record.card_id, created_at: 
            record.created_at.strftime("%d/%b")}}
    end

    def userSavings
        self.savings
    end

    def cardSavings
        self.saveCards
    end
end
