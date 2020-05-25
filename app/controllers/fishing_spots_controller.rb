class FishingSpotsController < ApplicationController
    before_action :find_fishing_spot, only: [:show, :update, :destroy]

    def index
        @fishing_spots = FishingSpot.all
        # include the fish in the fishing spot
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

        render :json => { :message => "Succesful." }
    end

    private
    def fishing_spot_params
        params.require(:fishing_spot).permit(:name,:longitude,:latitude,:site_info,:image,:public_access,:user_id)
    end

    def find_fishing_spot
        @fishing_spot = FishingSpot.find_by(id: params[:id])
    end
end
