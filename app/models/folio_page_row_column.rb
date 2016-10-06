class FolioPageRowColumn < ApplicationRecord
  belongs_to :folio_page_row
  belongs_to :folio_page
  belongs_to :folio

  belongs_to :caption, optional: true
  belongs_to :image, optional: true
end
