class CreateItemsOrders < ActiveRecord::Migration
  def change
    create_table :items_orders, id: false do |t|
    	t.integer :order_id
    	t.integer :item_id
    end
  end
end
