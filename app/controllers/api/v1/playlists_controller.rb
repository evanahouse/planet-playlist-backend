class Api::V1::PlaylistsController < ApplicationController
     def index
        @playlists = Playlist.all
        render json: @playlists
    end

    def search
        
        playlists = RSpotify::Playlist.search(params[:search], limit: 50, offset: 0)
        @playlists = playlists.map do |playlist|
            Playlist.new_from_spotify_playlist(playlist)
        end
        render json: @playlists
        
    end

    def show
        playlist = RSpotify::Playlist.find_by_id(params[:id])
        @tracks = playlist.tracks.map do |track|
            Track.new_from_spotify_track(track)
        end
        render json: @tracks
    end

   
end
