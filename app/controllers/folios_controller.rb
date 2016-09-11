class FoliosController < ApplicationController
  def index

  end

  def new
    needs_authentication
    @folio = Folio.new
  end

  def create
    needs_authentication
    @folio = Folio.new(folio_params.merge(user_id: current_user.id))

    if @folio.save
      redirect_to @folio
    else
      render 'new'
    end
  end

  def show
    @folio = Folio.find(params[:id])
    @first_folio_page = @folio.folio_pages.order(:page_order).first
  end

  private
  def folio_params
    params.require(:folio).permit(:name, :description, :tags)
  end
end
