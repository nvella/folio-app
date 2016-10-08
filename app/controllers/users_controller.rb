class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    raise 'User doesn\'t exist' if @user.nil?
  end

  def edit
    needs_authentication
    @user = User.find(params[:id])
    raise 'Folio doesn\'t exist' if @user.nil?
    raise 'You don\'t have permission to edit this user' \
      if current_user != @user
  end

  def update
    needs_authentication
    @user = User.find(params[:id])
    raise 'Folio doesn\'t exist' if @user.nil?
    raise 'You don\'t have permission to edit this user' \
      if current_user != @user

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:bio)
  end
end
