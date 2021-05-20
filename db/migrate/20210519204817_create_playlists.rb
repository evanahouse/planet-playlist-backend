class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.string :owner
      t.string :spotify_id

      t.timestamps
    end
  end
end
