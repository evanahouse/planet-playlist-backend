class UserSerializer < ActiveModel::Serializer
  attributes :username, :reviews, :playlists
  def reviews
    object.reviews.map do |review|
      { 
        id: review.id,
        content: review.content,
        updated_at: review.updated_at,
        playlist: Playlist.new_from_spotify_playlist(RSpotify::Playlist.find_by_id(review.playlist.spotify_id))
      }  
    end 
  end
end
