class FoliosController < ApplicationController
  def index
    # TODO pagination
    @folios = Folio.all
  end

  def new
    needs_authentication
    @folio = Folio.new
  end

  def edit
    needs_authentication
    @folio = Folio.find(params[:id])
    rause 'Folio doesn\'t exist' if @folio.nil?
    raise 'You don\'t have permission to edit this folio' \
      if current_user != @folio.user
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

  def update
    needs_authentication
    @folio = Folio.find(params[:id])
    rause 'Folio doesn\'t exist' if @folio.nil?
    raise 'You don\'t have permission to edit this folio' \
      if current_user != @folio.user

    if @folio.update(folio_params)
      redirect_to @folio
    else
      render 'edit'
    end
  end

  def show
    @folio = Folio.find(params[:id])
    raise 'Folio doesn\'t exist' if @folio.nil?
    @first_folio_page = @folio.folio_pages.order(:page_order).first
  end

  private
  def folio_params
    params.require(:folio).permit(:name, :description, :tags)
  end
end
