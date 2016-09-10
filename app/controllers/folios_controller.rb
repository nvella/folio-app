class FoliosController < ApplicationController
  def index

  end

  def new
    @folio = Folio.new
  end

  def create
    @folio = Folio.new(folio_params)

    if @folio.save
      redirect_to @folio
    else
      render 'new'
    end
  end

  def show
    @folio = Folio.find(params[:id])
  end

  private
  def folio_params
    params.require(:folio).permit(:name, :description, :tags)
  end
end
