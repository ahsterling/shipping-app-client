class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
    end
  end

  def show
    if current_order.address
      zip = current_order.address.postal_code
    end
    total_weight = 0
    current_order.items.each do |item|
      total_weight += item.product.weight
    end
    total_weight = total_weight * 16
    rates = HTTParty.get("http://ishipit.herokuapp.com/search?package_info[weight]=#{total_weight}&package_info[dest_zip]=#{zip}").parsed_response
    @usps = rates['usps']
    @fedex = rates['fedex']

  end

  def update

  end
end
