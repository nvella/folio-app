class AddStuffToFolioPageRowColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :folio_page_row_columns, :image_id, :integer
    add_column :folio_page_row_columns, :caption_id, :integer
  end
end
