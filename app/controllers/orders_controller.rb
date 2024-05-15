class OrdersController < ApplicationController
    before_action :load_pricing_data
    
    def create
      @order = Order.new(order_params)
    
      if @order.save
        order_data = process_order_data
        render json: order_data, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def load_pricing_data
      @prices = {}
      pricing_data = JSON.parse(File.read(Rails.root.join('pricing.json')))
  
      pricing_data['prices'].each do |price|
        @prices[price['product_id']] = {
          price: price['price'],
          vat_band: price['vat_band']
        }
      end
  
      @vat_bands = pricing_data['vat_bands']
    end
  
    def order_params
      params.require(:order).permit(:id, :customer_id, line_items_attributes: [:product_id, :quantity])
    end
  
    def process_order_data
      order_total = 0
      order_vat = 0
      items = []
  
      @order.line_items.each do |item|
        product_id = item.product_id
        quantity = item.quantity
  
        price = @prices[product_id][:price]
        vat_rate = @vat_bands[@prices[product_id][:vat_band]]
  
        item_total_price = price * quantity
        item_total_vat = item_total_price * vat_rate
  
        order_total += item_total_price
        order_vat += item_total_vat
  
        items << {
          "product_id": product_id,
          "quantity": quantity,
          "price_per_unit": price,
          "vat_per_unit": (vat_rate * price).round,
          "total_price": item_total_price,
          "total_vat": item_total_vat.round
        }
      end
  
      order_data = {
        "order": {
          "id": params[:order][:id],
          "total_price": order_total.round,
          "total_vat": order_vat.round,
          "items": items
        }
      }
  
      order_data
    end
  end
  