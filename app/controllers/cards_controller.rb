class CardsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        cards = Card.all
        render json: cards
    end

    def create
        card = Card.create!(valid_params)
        render json: card, status: :created
    end

    def destroy
        card = finder
        card.destroy
        head :no_content
    end

    def show
        card = finder
        render json: card
    end

    def update
        card = finder
        card.update(valid_params)
        render json: card, status: :accepted
    end

    private

    def finder
        Card.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :balance, :user_id,:bank)
    end


    def no_records
        render json: {error: "Card not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
