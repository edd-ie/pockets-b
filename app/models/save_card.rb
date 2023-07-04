class SaveCard < ApplicationRecord
    belongs_to :card
    belongs_to :saving
end
