class Image < ApplicationRecord
  belongs_to :user
  belongs_to :folio_page

  mount_uploader :image, ImageUploader
end
