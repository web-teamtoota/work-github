class AddDetailsToOrderDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :quantity, :integer
    add_column :order_details, :price, :integer
    add_column :order_details, :making_status, :integer
  end
end
