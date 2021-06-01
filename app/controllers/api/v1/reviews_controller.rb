class Api::V1::ReviewsController < ApplicationController
       def index
        reviews = Review.all
        render json: reviews, except: [:user_id, :created_at, :updated_at]
    end

    def show
        review = Review.find_by(id: params[:id])
        render json: review, except: [:user_id, :created_at, :updated_at]
    end

    def create
        playlist = Playlist.find_by(spotify_id: review_params[:spotify_id])
        if playlist
            review = Review.new(
            content: review_params[:content],
            user_id: current_user.id,
            playlist_id: playlist.id
            )
            review.save
            render json: review
        else
            newPlaylist = Playlist.create(spotify_id: review_params[:spotify_id])
            review = Review.new(
            content: review_params[:content],
            user_id: current_user.id,
            playlist_id: newPlaylist.id
            )
            review.save
            render json: review
        end

    end

    def update
        review = Review.find_by(id: params[:id])
        review.update(review_params)
        render json: review
    end

    def destroy
        review = Review.find_by(id: params[:id]) 
        review.destroy
        # render status :ok
    end

    private

    def review_params
        params.require(:review).permit(:spotify_id, :content)
    end
end