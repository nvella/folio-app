class FolioPageRow < ApplicationRecord
  belongs_to :folio_page
  belongs_to :folio

  has_many :folio_page_row_columns

  after_create :make_cols

  def make_cols
    4.times { folio_page_row_columns.create(folio_id: self.folio_id,
      folio_page_id: self.folio_page_id) }
  end
end
