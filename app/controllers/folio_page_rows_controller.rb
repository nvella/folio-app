class FolioPageRowsController < ApplicationController
  def create
    @folio_page_row = FolioPageRow.find(params[:id])
    @folio_page = @folio_page_row.folio_page
    @folio = @folio_page_row.folio
    
    needs_authentication
    needs_own_folio
  end
end
