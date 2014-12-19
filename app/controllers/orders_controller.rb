class OrdersController < ApplicationController

  def show
    @order = Order.find_by(number: params[:number])
    @shipping_total = Money.new(@order.shipping_total)
  end

  def update

    order_form = OrderForm.new(current_order, params[:order])
    if order_form.save
      redirect_to cart_path(order_form.order.number)
    end
  end

  def finalize

    order_form = OrderForm.new(current_order, params[:order])
    if order_form.save
      session[:order_number] = nil
      redirect_to order_path(order_form.order.number)
    end
  end

end
