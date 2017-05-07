class Picture < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :thumbnail, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end
