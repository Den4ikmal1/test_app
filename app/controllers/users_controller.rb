class UsersController < ApplicationController
	private

	def users_params

   		params.require(:user).permit(:login)

	end
end
