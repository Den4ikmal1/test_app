class User < ActiveRecord::Base
<<<<<<< HEAD
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd

	has_one :cart
	has_many :orders
	has_many :comments
	
end
