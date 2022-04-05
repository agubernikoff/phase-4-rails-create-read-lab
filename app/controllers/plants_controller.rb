class PlantsController < ApplicationController
    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant
        else render json: {error: "No plant found"}, status: :not_found
    end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end
    private
    def plant_params
        params.permit(:name,:image,:price,:created_at,:updated_at)
    end
end
