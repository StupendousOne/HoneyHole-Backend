class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        # include his favorites, reviewed spots, and reviews
        render :json => @users, include: [:reviews, :reviewed_fishing_spots, :favorite_fishing_spots], status: :ok
    end

    def create
        @user = User.create(user_params)
        if @user.persisted?
            render :json => @user, status: :created
        else
            render :json => { errors: @user.errors }
        end
    end

    def show
        if @user
            render :json => @user
        else
            render :json => {error: 'User not found'}, status: :not_found
        end
    end

    def update
        @user.update(user_params)
        if @user.persisted?
            render :json => @user, status: :ok
        else
            render :json => { errors: @user.errors }
        end
    end

    def destroy
        @user.is_active = false
        if(@user.save())
            render :json => { :message => "Succesful." }
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:bio,:username,:email,:is_active)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
