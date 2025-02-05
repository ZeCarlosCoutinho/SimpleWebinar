class SubscriptionsController < ApplicationController
  def create
    new_subscription = Subscription.new(
      email: create_params[:email],
      firstname: create_params[:firstname],
      surname: create_params[:surname],
      registration_ip: create_params[:registration_ip],
      broadcast: Broadcast.find_by(id: create_params[:broadcast_id])
    )

    return head :bad_request unless new_subscription.valid?

    new_subscription.save!
    head :created
  end

  private

  def create_params
    params.require(:subscription).permit(:email, :firstname, :surname, :registration_ip, :broadcast_id)
  end
end
