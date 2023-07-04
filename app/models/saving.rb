class Saving < ApplicationRecord
    belongs_to :user
    has_many :saveCards
    has_many :saveSims
end
