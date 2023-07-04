class SaveCardsController < ApplicationController
    def index
        save_cards = SaveCard.all
        render json: save_cards
    end
end
