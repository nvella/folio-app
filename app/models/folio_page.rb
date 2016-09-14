class FolioPage < ApplicationRecord
  belongs_to :folio
  has_many :folio_page_rows
end
