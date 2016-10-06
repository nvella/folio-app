class Caption < ApplicationRecord
  belongs_to :user
  belongs_to :folio_page
end
