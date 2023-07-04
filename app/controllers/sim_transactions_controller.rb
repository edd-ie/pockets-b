class SimTransactionsController < ApplicationController
    def index
        sim_transactions = SimTransaction.all
        render json: sim_transactions
    end

    
end
