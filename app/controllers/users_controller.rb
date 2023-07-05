class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        users = User.all
        render json: users
    end


    def create
        user = User.create(user_params)
        if user.valid?
        render json: user, status: :created
        else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = finder
        render json: user
    end

    def simCat
        user = finder
        ranks = user.simData
        render json: ranks
    end

    def cardCat
        user = finder
        ranks = user.cardData
        render json: ranks
    end

    def topSim
        user = finder
        top = user.topSimAction
        render json: top
    end

    def topCard
        user = finder
        top = user.topCardAction
        render json: top
    end

    def userSim
        user = finder
        sims = user.userSims
        render json: sims
    end

    def userCard
        user = finder
        sims = user.userCards
        render json: sims
    end

    def simUsage
        user = finder
        use = user.simUse
        render json: use
    end

    def cardUsage
        user = finder
        use = user.cardUse
        render json: use
    end

    private
    def finder
        User.find(params[:id])
    end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation, :subscription)
    end

    def no_records
        render json: {error: "Sim not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
