class CreateFolioComments < ActiveRecord::Migration[5.0]
  def change
    create_table :folio_comments do |t|
      t.integer :user_id
      t.integer :folio_id
      t.string :text

      t.timestamps
    end
  end
end
