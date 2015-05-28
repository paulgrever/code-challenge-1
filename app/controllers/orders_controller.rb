class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    item = Item.find_by(id: params[:item_id])
    @order = Order.new(amount: 1, user_id: User.first.id)
      if @order.save
        @order.items << item
        redirect_to order_path(@order)
      else
        render(:back)
      end

  end
end