class FoliosController < ApplicationController
  def index

  end

  def new

  end

  def create
    @folio = Folio.new(folio_params)

    @folio.save
    redirect_to @folio
  end

  def show
    @folio = Folio.find(params[:id])
  end

  private
  def folio_params
    params.require(:folio).permit(:name, :description, :tags)
  end
end
