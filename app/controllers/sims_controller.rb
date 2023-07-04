class SimsController < ApplicationController
    def index
        sims = Sim.all
        render json: sims
    end
end
