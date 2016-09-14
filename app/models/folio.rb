class Folio < ApplicationRecord
  belongs_to :user
  has_many :folio_pages
  has_many :folio_page_rows

  validates :name, presence: true, length: { minimum: 5 }
end
