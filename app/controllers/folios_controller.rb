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
  end

  private
  def folio_params
    params.require(:folio).permit(:title, :description, :tags)
  end
end
