class SavingsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        savings = Saving.all
        render json: savings
    end
    
    def create
        savings = Saving.create!(valid_params)
        render json: savings, status: :created
    end

    def destroy
        savings = finder
        Saving.destroy
        head :no_content
    end

    def show
        savings = finder
        render json: savings
    end

    def update
        savings = finder
        Saving.update(valid_params)
        render json: savings, status: :accepted
    end

    def addCardSave
        save = finder
        new_save = save.saveCards.create!({goalName:params[:goalName],amount:params[:amount],saving_id:params[:id],card_id:params[:card_id]})
        render json: new_save
    end

    def addSimSave
        save = finder
        new_save = save.saveSims.create!({goalName:params[:goalName],amount:params[:amount],saving_id:params[:id],sim_id:params[:sim_id]})
        render json: new_save
    end
    
    private

    def finder
        Saving.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :goal, :saving_id, :goalName, :sim_id, :card_id,:amount, :duration, :saved_amount, :user_id)
    end


    def no_records
        render json: {error: "savings not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
