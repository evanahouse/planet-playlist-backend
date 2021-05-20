class User < ApplicationRecord
    has_many :reviews
    has_many :playlists, through: :reviews
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 20}
    
   
end
