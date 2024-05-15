class AddVatToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :vat, :decimal
  end
end
