class UserController < ApplicationController
  # TODO: add actions here
  def create
    user = User.create!(user_params)
    redirect_to user
  end

  private
  def user_params
    params.require(:user).permit(:gif)
  end
end
