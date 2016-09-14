class CreateFolioPageRowColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :folio_page_row_columns do |t|
      t.integer :folio_id
      t.integer :folio_page_id
      t.integer :folio_page_row_id
      t.integer :column_order
      t.integer :column_width
      t.string :type

      t.timestamps
    end
  end
end
