class SentsController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @messages = Message.where(sender: current_user).order(created_at: :desc)
  end
end
