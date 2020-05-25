class Api::V1::FishSpotsController < ApplicationController
    before_action :find_fish_spot, only: [:show, :update, :destroy]

    def create
        @fish_spot = FishSpot.create(fish_spot_params)
        if @fish_spot.persisted?
            render :json => @fish_spot, status: :created
        else
            render :json => { errors: @fish_spot.errors }
        end
    end

    def destroy
        render :json => { :message => "Succesful." }
    end

    private
    def fish_spot_params
        params.require(:fish_spot).permit(:fish_id,:fishing_spot_id)
    end

    def find_fish_spot
        @fish_spot = FishSpot.find_by(id: params[:id])
    end
end
