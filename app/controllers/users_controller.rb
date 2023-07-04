class UsersController < ApplicationController
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

    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation, :subscription)
    end
end
