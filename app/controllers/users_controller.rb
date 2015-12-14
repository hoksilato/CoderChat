class UsersController < ApplicationController
  before_action :require_user, only: [:index]
  before_action :redirect_to_messages_if_signed_in, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to messages_path, flash: {success: "Welcome <strong>#{current_user.name}</strong>!"}
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
