class FolioPageRow < ApplicationRecord
  belongs_to :folio_page
  belongs_to :folio

  has_many :folio_page_row_columns

  after_create :make_cols

  def make_cols
    4.times do |i|
      folio_page_row_columns.create(folio_id: self.folio_id,
        folio_page_id: self.folio_page_id, column_width: 1, column_order: i)
    end
  end
end
