class BroadcastsController < ApplicationController
  def index
    render json: Broadcast.all.order(:created_at)
  end
end
