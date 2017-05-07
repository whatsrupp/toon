class Picture < ApplicationRecord
  validates :file_path, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

end
