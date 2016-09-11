class CreateFolioPages < ActiveRecord::Migration[5.0]
  def change
    create_table :folio_pages do |t|
      t.integer :folio_id
      t.integer :page_order
      t.string :title

      t.timestamps
    end
  end
end
