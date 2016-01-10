class ItemsController < ApplicationController


	before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote,:subtract]
	before_filter :check_if_admin, only: [:edit, :update, :create, :new, :destroy]


	def index 
		@items=Item
		@items=@items.where("price >= ?", params[:price_from] ) if params[:price_from] 
		@items=@items.order("price DESC")
		@items=@items.where("created_at >=?", 1.day.ago) 		if params[:today]
		@items=@items.where("votes_count =?", params[:votes_from] ) if params[:votes_from] 

	end

	def show
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
			#flash_success("Item successfully created")
			redirect_to item_path(@item)
		else
			#flash_error("You made mistakes in yor form!")
			render "new"
		end
	end

	def update
		
		@item.update_attributes(items_params)
		if @item.errors.empty?
			#flash_success("Item successfully updater")
			redirect_to item_path(@item)
		else
			#flash_error("You made mistakes in yor form!")
			render "edit"
		end
	end

	def destroy
		
		@item.destroy
		redirect_to action: "index"
	end

	
	def upvote
  		@item.increment!(:votes_count) 
  		redirect_to action: "index"
 	end

 	def subtract
  		@item.decrement!(:votes_count) 
  		redirect_to action: "index"
 	end

 	def expensive
 		@items = Item.where(:price => 100..200)
 		render "index"
 	end

	private

	def items_params

   		params.require(:item).permit(:name, :price, :real, :weight, :avatar)

	end

	
	def find_item
		@item = Item.where(id: params[:id]).first
		render_404 unless @item 
	end

	
end
