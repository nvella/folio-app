class CreateFolios < ActiveRecord::Migration[5.0]
  def change
    create_table :folios do |t|

      t.timestamps
    end
  end
end
