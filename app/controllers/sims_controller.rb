class SimsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        sims = Sim.all
        render json: sims
    end

    def create
        sim = Sim.create!(valid_params)
        render json: sim, status: :created
    end

    def destroy
        sim = finder
        sim.destroy
        head :no_content
    end

    def show
        sim = finder
        render json: sim
    end

    def update
        sim = finder
        sim.update(valid_params)
        render json: sim, status: :accepted
    end

    private

    def finder
        Sim.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :balance, :user_id, :simName)
    end


    def no_records
        render json: {error: "Sim not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
