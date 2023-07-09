class SaveSimsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        save_sims = SaveSim.all
        render json: save_sims
    end
    
    def create
        save_sim = SaveSim.create!(valid_params)
        render json: save_sim, status: :created
    end

    def destroy
        save_sim = finder
        save_sim.destroy
        head :no_content
    end

    def show
        save_sim = finder
        render json: save_sim
    end

    def update
        save_sim = finder
        save_sim.update(valid_params)
        render json: save_sim, status: :accepted
    end

    private

    def finder
        SaveSim.find(params[:id])
    end

    def valid_params
        params.permit(:id, :goalName, :amount, :saving_id, :sim_id)
    end


    def no_records
        render json: {error: "save_sim not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
