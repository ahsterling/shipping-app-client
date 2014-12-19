class OrderForm
  attr_accessor :order

  def initialize(order, params)
    @order = order
    if params
      if params['credit_card']
        @order.build_credit_card(params.require(:credit_card).permit!)
      end
      if params['shipping_total']
        @order.shipping_total = params['shipping_total']
      end
    end
  end

  def save
    @order.save
  end

end
