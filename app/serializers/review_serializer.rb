class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :playlist_id, :updated_at
end
