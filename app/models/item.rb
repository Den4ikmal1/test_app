class Item < ActiveRecord::Base
	validates :name, presence: true

	validates :price, numericality: { greater_than: 0 }


	has_many :position
	has_many :carts, through: :positions
	has_many :comments, as: :commentable
<<<<<<< HEAD
	has_and_belongs_to_many :orders
=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


end
