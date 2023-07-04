class SavingsController < ApplicationController
    def index
        savings = Saving.all
        render json: savings
    end
end
