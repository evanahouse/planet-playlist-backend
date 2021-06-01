class Api::V1::TracksController < ApplicationController
    def index
        @tracks = Track.all
        render json: @tracks
    end

    def top_100
        s_tracks = RSpotify::Playlist.find("1247049388","6BHR0DJ8NXHO1GbE6T7X1H").tracks
        @tracks = s_tracks.map do |s_track|
            Track.new_from_spotify_track(s_track)
        end
        render json: @tracks
    end

    def random
        s_tracks = RSpotify::Playlist.browse_featured.first.tracks
        @tracks = s_tracks.map do |s_track|
            Track.new_from_spotify_track(s_track)
        end
        render json: @tracks
    end

    def search
        # s_tracks = RSpotify::Track.search(params[:q])
        # @tracks = s_tracks.map do |s_track|
        #     Track.new_from_spotify_track(s_track)
        # end
        playlists = RSpotify::Playlist.search('Rock')
        # @tracks = playlists.first.tracks.map do |track|
        #     Track.new_from_spotify_track(track)
        # end
        @playlist = playlists.first
        render json: @playlist
    end
end
