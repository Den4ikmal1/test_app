class ItemsController < ApplicationController


	before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote,:subtract]
	before_filter :check_if_admin, only: [:edit, :update, :create, :new, :destroy]
	helper_method :sort_column, :sort_direction


	def index 
		
		@items = Item.order(sort_column + " " + sort_direction)
		# @items=@items.where("price >= ?", params[:price_from] ) if params[:price_from] 
		# @items=@items.order("price DESC")
		# @items=@items.where("created_at >=?", 1.day.ago) 		if params[:today]
		# @items=@items.where("votes_count =?", params[:votes_from] ) if params[:votes_from] 
		# @items = @items.order(sort_column + " " + sort_direction)

	end

	def show
<<<<<<< HEAD
		
=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
		render_404 unless @item
	end

	def new
		@item = Item.new
	end

	def edit
		

	end


	def create
		@item = Item.create(items_params)
		if @item.errors.empty?
			flash_success("Item successfully created")
			redirect_to item_path(@item)
<<<<<<< HEAD

		else
			flash_error("You made mistakes in yor form!")
=======
		else
			#flash_error("You made mistakes in yor form!")
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
			render "new"
		end
	end

	def update
		
		@item.update_attributes(items_params)
		if @item.errors.empty?
			flash_success("Item successfully updater")
			redirect_to item_path(@item)
		else
<<<<<<< HEAD
			flash_error("You made mistakes in yor form!")
=======
			#flash_error("You made mistakes in yor form!")
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
			render "edit"
		end
	end

	def destroy
		
		@item.destroy
<<<<<<< HEAD
		respond_to  do |i|
			i.html {redirect_to action: "index", notice: 'Item successfully delete'}	
			i.json { head :no_content }
			i.js   {}

		end
		ItemsMailer.item_destroyed(@item).deliver
=======
		redirect_to action: "index"
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
	end

	
	def upvote
  		@item.increment!(:votes_count) 
  		redirect_to action: "index"
<<<<<<< HEAD
  		
=======
>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
 	end

 	def subtract
  		@item.decrement!(:votes_count) 
  		redirect_to action: "index"
 	end

 	def expensive
 		@items = Item.where(:price => 100..200)
 		render "index"
 	end
<<<<<<< HEAD
 	
 	
=======

>>>>>>> 9a6e046fa20413fc904d033901be4c0ea820b9cd
 	

	private

	def items_params

   		params.require(:item).permit(:name, :price, :real, :weight, :avatar)

	end

	
	def find_item
		@item = Item.where(id: params[:id]).first
		render_404 unless @item 
	end

	def sort_column
    	Item.column_names.include?(params[:sort]) ? params[:sort] : "price"
  	end
  
  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end

	
end
