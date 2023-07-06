class CardTransactionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        card_transactions = CardTransaction.all
        render json: card_transactions
    end

    def create
        card_transaction = CardTransaction.create!(valid_params)
        render json: card_transaction, status: :created
    end

    def destroy
        card_transaction = finder
        card_transaction.destroy
        head :no_content
    end

    def show
        card_transaction = finder
        render json: card_transaction
    end

    def update
        card_transaction = finder
        card_transaction.update(valid_params)
        render json: card_transaction, status: :accepted
    end

    private

    def finder
        CardTransaction.find(params[:id])
    end

    def valid_params
        params.permit(:id, :category, :amount, :card_id)
    end


    def no_records
        render json: {error: "CardTransaction not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
