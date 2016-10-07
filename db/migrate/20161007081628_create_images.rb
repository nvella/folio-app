class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :folio_page_id
      t.integer :user_id

      t.timestamps
    end
  end
end
