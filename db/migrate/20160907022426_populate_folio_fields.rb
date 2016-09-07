class PopulateFolioFields < ActiveRecord::Migration[5.0]
  def change
    add_reference :folios, :user, index: true, foreign_key: true
    add_column :folios, :name, :string
    add_column :folios, :description, :string
    add_column :folios, :tags, :tags
  end
end
