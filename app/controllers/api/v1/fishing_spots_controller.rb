class Api::V1::FishingSpotsController < ApplicationController
    before_action :find_fishing_spot, only: [:show, :update, :destroy]

    def index
        @fishing_spots = FishingSpot.all
        render :json => @fishing_spots, include: :fish, status: :ok
    end

    def create
        @fishing_spot = FishingSpot.create(fishing_spot_params)
        if @fishing_spot.persisted?
            render :json => @fishing_spot, status: :created
        else
            render :json => { errors: @fishing_spot.errors }
        end
    end

    def show
        if @fishing_spot
            render :json => @fishing_spot
        else
            render :json => {error: 'Fishing Spot not found'}, status: :not_found
        end
    end

    def update
        @fishing_spot.update(fishing_spot_params)
        if @fishing_spot.persisted?
            render :json => @fishing_spot, status: :ok
        else
            render :json => { errors: @fishing_spot.errors }
        end
    end

    def destroy
        @fishing_spot.is_active = false
        if(@fishing_spot.save())
            render :json => { :message => "Succesful." }
        end
    end

    private
    def fishing_spot_params
        params.require(:fishing_spot).permit(:name,:image,:public_access,:site_info,:latitude,:longitude,:user_id,:is_active)
    end

    def find_fishing_spot
        @fishing_spot = FishingSpot.find_by(id: params[:id])
    end
end
