class CreateCartsItems < ActiveRecord::Migration
<<<<<<< HEAD
  def change
=======
  def up
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
    create_table :carts_items, id: false do |t|
    	t.integer :cart_id
    	t.integer :item_id

    end
<<<<<<< HEAD
    
=======
    drop_table :carts_items
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
  end
end
