class SimTransactionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        sim_transactions = SimTransaction.all
        render json: sim_transactions
    end

    def create
        sim_transaction = SimTransaction.create!(valid_params)
        render json: sim_transaction, status: :created
    end

    def destroy
        sim_transaction = finder
        sim_transaction.destroy
        head :no_content
    end

    def show
        sim_transaction = finder
        render json: sim_transaction
    end

    def update
        sim_transaction = finder
        sim_transaction.update!(valid_params)
        render json: sim_transaction, status: :accepted
    end

    private

    def finder
        SimTransaction.find(params[:id])
    end

    def valid_params
        params.permit(:id, :category, :amount, :sim_id)
    end


    def no_records
        render json: {error: "SimTransaction not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
