class AddImageDateToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_date, :date
  end
end
