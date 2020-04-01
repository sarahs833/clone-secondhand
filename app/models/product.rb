class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one_attached :photo
  belongs_to :user
  has_one :booking
end
