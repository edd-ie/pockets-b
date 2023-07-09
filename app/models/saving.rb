class Saving < ApplicationRecord
    belongs_to :user
    has_many :saveCards, dependent: :destroy
    has_many :saveSims, dependent: :destroy

    def saved 
        simAmnt = 0
        cardAmnt = 0
        sims = self.saveSims.each{|i| simAmnt += i[:amount]}
        cards = self.saveCards.each{|i| cardAmnt += i[:amount]}
        goal = self.goal
        name = self.name
        duration = self.duration
        remain = goal - (simAmnt + cardAmnt)
        self.update!(saved_amount: (simAmnt + cardAmnt))
        all = {id: self.id, name:name, goal: goal, duration: duration, simContrib: simAmnt, cardContrib: cardAmnt, Remaining: remain}
        return all
    end

end
