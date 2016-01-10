class Cart < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :items
	has_many :position
	has_many :items, through: :positions
end
