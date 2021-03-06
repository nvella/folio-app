class FolioPage < ApplicationRecord
  belongs_to :folio
  has_many :folio_page_rows
  has_many :folio_page_row_columns

  validates :title, presence: true, length: { minimum: 1 }
end
