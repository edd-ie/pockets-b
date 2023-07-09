class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    

    def index
        users = User.all
        render json: users
    end

    def update
        user = finder
        user.update(user_params)
        render json: user
    end

    def changePass
        user = User.find_by(email: params[:email])
        user.update(password: params[:password], 
            password_confirmation: params[:password]
        )
        render json: user
    end


    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created        
    end

    def show
        user = User.find(session[:user_id])
        if user
            render json: user
        else
            render json: {error: "User not logged in"}, status: :unauthorized
        end
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

    def simBal
        user = finder
        balance = user.userSimBal
        render json: balance
    end

    def cardBal
        user = finder
        balance = user.userCardBal
        render json: balance
    end

    def userSavings
        user = finder
        savings = user.userSavings
        render json: savings
    end

    private

    def finder
        User.find(params[:id])
    end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation, :subscription)
    end

    def no_records
        render json: {error: "User not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
