class ItemsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js
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
  def destroy
    @item=Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html {redirect_to items_path}
      format.js
    end
  end

  def vote
    @item=Item.find(params[:id])
    @item.update_attributes(:vote, @item.votes+1)
    respond_to do |format|
      format.html {redirect_to items_path}
      format.js
    end
  end
end
