class FolioPageRowColumn < ApplicationRecord
  belongs_to :folio_page_row
  belongs_to :folio_page
  belongs_to :folio
end
