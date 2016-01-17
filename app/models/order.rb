class Order < ActiveRecord::Base

	belongs_to :user
<<<<<<< HEAD

	has_and_belongs_to_many :items

	def calculate_total
		write_attribute :total, items.map(&:price).inject(:+)
	end
	
=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
	
end
