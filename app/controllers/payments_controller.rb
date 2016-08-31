class PaymentsController < ApplicationController
  before_action :set_reservation

  def new
  end

  def create
    @amount_cents = @reservation.amount_cents

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @amount_cents, # in cents
      description:  "Payment for event #{@reservation.event_sku} for reservation #{@reservation.id}",
      currency:     'eur'
    )

    @reservation.update(payment: charge.to_json, state: 'paid')
    redirect_to dashboard_path, notice: "Votre réservation a été validée"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_event_reservation_payment_path(@reservation)
  end

private

  def set_reservation
    @reservation = Reservation.where(state: 'pending').find(params[:reservation_id])
    authorize @reservation
  end
end
