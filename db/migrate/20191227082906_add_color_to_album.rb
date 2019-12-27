class AddColorToAlbum < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :color, :string, null: false
  end
end
