require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  describe 'POST #update' do
    it 'changes the shipping total' do
      Order.create(number: "123456")
      patch :update, number: 123456, order: {shipping_total: 100}
      expect(Order.last.shipping_total).to eq 100
    end
  end

  describe 'POST #finalize' do
    it 'redirects upon saving' do
      Order.create(number: "123456")
      post :finalize, number: 123456, order: {shipping_total: 100}
      expect(response.status).to eq 302
    end
  end

end
