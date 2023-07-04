class CardTransactionsController < ApplicationController
    def index
        card_transactions = CardTransaction.all
        render json: card_transactions
    end
end
