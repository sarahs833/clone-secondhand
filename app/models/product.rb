class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one_attached :photo
  belongs_to :user
  has_one :booking

  include PgSearch::Model
  pg_search_scope :search_by_name_description,
    against: [ :name, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
