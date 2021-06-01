class Playlist < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    
    def self.new_from_spotify_playlist(spotify_playlist)
        Playlist.new(
        name: spotify_playlist.name,
        description: spotify_playlist.description,
        img_url: spotify_playlist.images[0]["url"],
        owner: spotify_playlist.owner.display_name,
        spotify_id: spotify_playlist.id
        )
    end

    def self.create_from_spotify_track(spotify_playlist)
        playlist = self.new_from_spotify_track(spotify_playlist)
        playlist.save
        playlist
    end
end
