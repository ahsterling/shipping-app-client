require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  describe 'POST #update' do
    it 'changes the shipping total' do
      Order.create(number: 123456)
      patch :update, number: 123456, order: {shipping_total: 100}
      expect(Order.find(o.id)).to eq 100
    end
  end

end
