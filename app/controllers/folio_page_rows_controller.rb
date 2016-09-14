class FolioPageRowsController < ApplicationController
  def create
    @folio = Folio.find(params[:folio_id])
    @folio_page = FolioPage.find(params[:folio_page_id])
    @folio_page_row = FolioPageRow.new(folio_page_row_params.merge(folio:
      @folio, folio_page: @folio_page))

    needs_authentication
    needs_own_folio

    if @folio_page_row.save
      redirect_to @folio_page
    else
      render json: {status: 'error', error: @folio_page.errors.full_messages}
    end
  end

  private
  def folio_page_row_params
    params.permit(:folio_id, :folio_page_id, :row_order)
  end
end
