class SaveCardsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        save_cards = SaveCard.all
        render json: save_cards
    end

    def create
        save_card = SaveCard.create!(valid_params)
        render json: save_card, status: :created
    end

    def destroy
        save_card = finder
        save_card.destroy
        head :no_content
    end

    def show
        save_card = finder
        render json: save_card
    end

    def update
        save_card = finder
        save_card.update(valid_params)
        render json: save_card, status: :accepted
    end

    private

    def finder
        SaveCard.find(params[:id])
    end

    def valid_params
        params.permit(:id, :goalName, :amount, :saving_id, :card_id)
    end


    def no_records
        render json: {error: "save_card not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
