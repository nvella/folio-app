class Folio < ApplicationRecord
  belongs_to :user
  has_many :folio_pages
  
  validates :name, presence: true, length: { minimum: 5 }
end
