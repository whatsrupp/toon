class AddAttachmentThumbnailToPictures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pictures do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :pictures, :thumbnail
  end
end
