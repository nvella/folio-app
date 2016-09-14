class CreateFolioPageRows < ActiveRecord::Migration[5.0]
  def change
    create_table :folio_page_rows do |t|
      t.integer :folio_id
      t.integer :folio_page_id
      t.integer :row_order

      t.timestamps
    end
  end
end
