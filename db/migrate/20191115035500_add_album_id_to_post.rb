class AddAlbumIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :album_id, :integer
  end
end
