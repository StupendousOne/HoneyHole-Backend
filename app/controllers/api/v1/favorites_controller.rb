class Api::V1::FavoritesController < ApplicationController
    before_action :find_favorite, only: [:show, :update, :destroy]

    def create
        @favorite = Favorite.create(favorite_params)
        if @favorite.persisted?
            render :json => @favorite, status: :created
        else
            render :json => { errors: @favorite.errors }
        end
    end

    def destroy
        @favorite.destroy()
        render :json => { :message => "Succesful." }
    end

    private
    def favorite_params
    t.bigint "fishing_spot_id", null: false
        params.require(:favorite).permit(:fishing_spot_id,:user_id)
    end

    def find_favorite
        @favorite = Favorite.find_by(id: params[:id])
    end
end
