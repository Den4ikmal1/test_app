class CreatePositions < ActiveRecord::Migration
<<<<<<< HEAD
  def up
=======
  def change
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
    create_table :positions do |t|
    	t.integer :cart_id
    	t.integer :item_id
    	t.integer :quantity
      t.timestamps 
    end
<<<<<<< HEAD
    drop_table :carts_items
=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
  end
end
