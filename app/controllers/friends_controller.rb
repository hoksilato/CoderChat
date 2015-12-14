class FriendsController < ApplicationController
  before_action :require_user, only: [:create]

  def create
    user = User.find(params[:id])
    if !user
      flash.now[:error] = "User not found"
    else
      friend = Friend.new

      friend.from_id = current_user.id
      friend.to_id = user.id
      if friend.save
        redirect_to users_path, flash: {success: 'Add friend successfully!'}
      else
        render friend.errors
        redirect_to users_path, flash: {error: 'Add friend failed!'}
      end
    end
  end
end
