class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_one :booking
end
