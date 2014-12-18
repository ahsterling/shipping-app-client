class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    if params
      @order.build_credit_card(params.require(:credit_card).permit!)
      @order.shipping_total = params['shipping_total']
    end
  end

  def save
    @order.save
  end

end
