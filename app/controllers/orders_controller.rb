class OrdersController < ApplicationController
  before_action :authorized
  before_action :set_order, only: [:show, :update]

  def show
    render json: { order: @order }, status: :ok
  end

  def create
    @order = Order.create(order_params)

    if @order.valid?
      render json: { order: @order }, status: :created
    else
      render json: { error: @order.error.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: { order: @order }, status: :ok
    else
      render json: { error: @order.error.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.permit(:status).merge(user_id: current_user.id)
  end
end
