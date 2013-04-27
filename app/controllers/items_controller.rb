class ItemsController < ApplicationController
  load_and_authorize_resource
	def create
  		@item = Item.new(params[:item])
      @categories= Category.all
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
    @item=Item.find_by_id(params[:id])
    @reviews=Review.where(item_id: @item.id,flag: false)
  end

  def index
    @page=params[:page]
  end
end
