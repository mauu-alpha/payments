class PaymentController < ApplicationController
  before_action :authorized
  before_action :set_payment, only: [:show, :update]

  def show
    render json: { order: @payment }, status: :ok
  end

  def create
    @payment = Payment.new(payment_params)

    @payment.pay

    if @payment.valid?
      render json: { order: @payment }, status: :created
    else
      render json: { error: @payment.error.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      render json: { order: @payment }, status: :ok
    else
      render json: { error: @payment.error.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.permit(:amount, :payment_method, :order_id)
  end
end
