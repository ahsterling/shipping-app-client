class AddsShippingTotalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_total, :integer
  end
end
