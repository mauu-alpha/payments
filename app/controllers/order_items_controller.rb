class OrderItemsController < ApplicationController
  before_action :authorized
  before_action :set_order_item, only: [:show, :update]

  def show
    render json: { order_item: @order_item }, status: :ok
  end

  def create
    @order_item = OrderItem.create(order_item_params)

    if @order_item.valid?
      render json: { order_item: @order_item }, status: :created
    else
      render json: { error: @order_item.error.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order_item.update(order_item_params)
      render json: { order_item: @order_item }, status: :ok
    else
      render json: { error: @order_item.error.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_item_params
    params.permit(:order_id, :product_id, :quantity, :unit_price)
  end
end
