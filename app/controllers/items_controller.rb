class ItemsController < ApplicationController

	def create
  		@item = Item.new(params[:item])
  		if @item.save
      		flash[:success] = "Welcome to the Ratings Site"
  			redirect_to @item
  		else
  			render 'new'
  		end
  	end

  	def new
  		@item=Item.new
  	end

  	def show

  	end

  	def index

  	end
end
