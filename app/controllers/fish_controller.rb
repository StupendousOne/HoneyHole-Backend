class FishController < ApplicationController
    before_action :find_fish, only: [:show, :update, :destroy]

    def index
        @fish = Fish.all
        # include the fishing spots the fish belongs to
        render :json => @fish, include: :fishing_spots, status: :ok
    end

    def create
        @fish = Fish.create(fish_params)
        if @fish.persisted?
            render :json => @fish, status: :created
        else
            render :json => { errors: @fish.errors }
        end
    end

    def show
        if @fish
            render :json => @fish
        else
            render :json => {error: 'Fish not found'}, status: :not_found
        end
    end

    def update
        @fish.update(fish_params)
        if @fish.persisted?
            render :json => @fish, status: :ok
        else
            render :json => { errors: @fish.errors }
        end
    end

    def destroy
        
        render :json => { :message => "Succesful." }
    end

    private
    def fish_params
        params.require(:fish).permit(:species,:description)
    end

    def find_fish
        @fish = Fish.find_by(id: params[:id])
    end

end
