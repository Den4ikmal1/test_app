class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 	before_filter :set_locale
<<<<<<< HEAD
 	before_filter :authenticate_user!, except: [:show, :index]

=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd

 	private

 	def check_if_admin
		#render_403  unless params[:admin]
	end
	
 	def render_403
 		render file: "public/403.html", status: 403
 		
 	end

 	def render_404
 		render file: "public/404.html", status: 404
 	end

 	def flash_error(str="empty")
 		flash.now[:error]=str
 	end

 	def flash_success(str="empty")
 		flash[:success]=str
 	end

 	def set_locale
 		I18n.locale = params[:locale] if params[:locale].present?
 	end

 	def default_url_options(options = {})
  		{ locale: I18n.locale }.merge options
	end

<<<<<<< HEAD
	

=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd

	protect_from_forgery with: :exception
end
