class FolioPagesController < ApplicationController
  def index

  end

  def new
    needs_authentication
    @folio_page = FolioPage.new(folio_id: params[:folio_id])
  end

  def create
    needs_authentication
    @folio_page = FolioPage.new(folio_page_params.merge(folio:
      Folio.find(params[:folio_id])))

    if @folio_page.save
      redirect_to @folio_page
    else
      render 'new'
    end
  end

  def show
    @folio_page = FolioPage.find(params[:id])
    @folio = @folio_page.folio
    @rows = @folio_page.folio_page_rows
    raise 'Folio Page doesn\'t exist' if @folio.nil?
  end

  def add_row
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
  def folio_page_params
    params.require(:folio_page).permit(:title, :folio_id)
  end

  def folio_page_row_params
    params.permit(:folio_id, :folio_page_id, :row_order)
  end
end
