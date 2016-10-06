class CaptionsController < ApplicationController
  def edit
    @caption = Caption.find(params[:id])
  end

  def update
    needs_authentication
    @caption = Caption.find(params[:id])
    rause 'Caption doesn\'t exist' if @caption.nil?
    raise 'You don\'t have permission to edit this folio' \
      if current_user != @caption.user

    if @caption.update(caption_params)
      redirect_to(@caption.folio_page)
    else
      render 'edit'
    end
  end

  private
  def caption_params
    params.require(:caption).permit(:text)
  end
end
