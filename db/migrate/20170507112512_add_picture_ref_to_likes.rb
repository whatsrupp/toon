class AddPictureRefToLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :picture, foreign_key: true
  end
end
