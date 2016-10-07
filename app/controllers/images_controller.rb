class ImagesController < ApplicationController
  def edit
    @image = Image.find(params[:id])
  end

  def update
    needs_authentication
    @image = Image.find(params[:id])
    raise 'Image doesn\'t exist' if @image.nil?
    raise 'You don\'t have permission to edit this folio' \
      if current_user != @image.user

    if @image.update(image_params)
      redirect_to(@image.folio_page)
    else
      render 'edit'
    end
  end

  private
  def image_params
    params.require(:image).permit(:image)
  end
end
