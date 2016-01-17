class CreateCartsItems < ActiveRecord::Migration

  def up

    create_table :carts_items, id: false do |t|
    	t.integer :cart_id
    	t.integer :item_id

    end

    drop_table :carts_items

  end
end
