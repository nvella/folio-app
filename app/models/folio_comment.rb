class FolioComment < ApplicationRecord
  belongs_to :folio
  belongs_to :user
end
