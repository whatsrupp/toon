class Picture < ApplicationRecord
  validates :file_path, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy


  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/

end
