class FolioPagesController < ApplicationController
  def index

  end

  def new
    needs_authentication
    @folio_page = FolioPage.new
  end

  def create
    needs_authentication
    @folio_page = FolioPage.new(folio_page_params)

    if @folio_page.save
      redirect_to @folio_page
    else
      render 'new'
    end
  end

  def show
    @folio_page = FolioPage.find(params[:id])
    @folio = @folio_page.folio
    raise 'Folio Page doesn\'t exist' if @folio.nil?
  end

  private
  def folio_page_params
    params.require(:folio_page).permit(:title)
  end
end
