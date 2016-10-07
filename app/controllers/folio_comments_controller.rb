class FolioCommentsController < ApplicationController
  def create
    needs_authentication

    @folio = Folio.find(folio_comments_params[:folio_id])
    raise 'Folio to comment on doesn\'t exist' if @folio.nil?

    @comment = FolioComment.new(folio_comments_params.merge(user_id: current_user.id))
    @comment.save!

    redirect_to @folio
  end

  private
  def folio_comments_params
    params.require(:folio_comment).permit(:folio_id, :text)
  end
end
