class Api::V1::ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :update, :destroy]

    def index
        @reviews = Review.all
        render :json => @reviews, status: :ok
    end

    def create
        @review = Review.create(review_params)
        if @review.persisted?
            render :json => @review, status: :created
        else
            render :json => { errors: @review.errors }
        end
    end

    def show
        if @review
            render :json => @review
        else
            render :json => {error: 'Review not found'}, status: :not_found
        end
    end

    def update
        @review.update(review_params)
        if @review.persisted?
            render :json => @review, status: :ok
        else
            render :json => { errors: @review.errors }
        end
    end

    def destroy
        @review.destroy()
        render :json => { :message => "Succesful." }
    end

    private
    def review_params
        params.require(:review).permit(:title,:content,:rating,:fishing_spot_id,:user_id)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end
end
