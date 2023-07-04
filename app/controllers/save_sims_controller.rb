class SaveSimsController < ApplicationController
    def index
        save_sims = SaveSim.all
        render json: save_sims
    end
end
