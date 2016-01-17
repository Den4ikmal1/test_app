class OrdersController < ApplicationController

	private
	def orders_params

   		params.require(:user).permit(:user, :user_id)

	end
end
