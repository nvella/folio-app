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
    @folio_page_row = FolioPageRow.new(add_row_params.merge(folio:
      @folio, folio_page: @folio_page))

    needs_authentication
    needs_own_folio

    if @folio_page_row.save
      redirect_to @folio_page
    else
      render json: {status: 'error', error: @folio_page.errors.full_messages}
    end
  end

  def merge_row_column
    @folio = Folio.find(params[:folio_id])
    @folio_page = FolioPage.find(params[:folio_page_id])

    needs_authentication
    needs_own_folio

    folio_page_row = FolioPageRow.find(params[:folio_page_row_id])
    col_1 = folio_page_row.folio_page_row_columns.
      find(params[:folio_page_row_column_id])

    raise 'Cannot merge row column with no adjacent row column' if
      col_1.column_width + col_1.column_order >= 4

    col_2 = folio_page_row.folio_page_row_columns.where(column_order:
      col_1.column_order + 1).first
    raise 'Adjacent row doesn\'t exist' if col_2.nil?

    col_1.column_width += col_2.column_width
    col_1.save
    col_2.destroy
    
    redirect_to @folio_page
  end

  private
  def folio_page_params
    params.require(:folio_page).permit(:title, :folio_id)
  end

  def merge_row_column_params
    params.permit(:folio_id, :folio_page_id, :folio_page_row_id,
      :folio_page_row_column_id)
  end

  def add_row_params
    params.permit(:folio_id, :folio_page_id, :row_order)
  end
end
