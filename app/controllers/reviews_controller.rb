class ReviewsController < ApplicationController
	respond_to :html, :js
	def new
		@review = Review.new
	end

	def create
		@review=Review.new(params[:review])
		if @review.save
			redirect_to Item.find_by_id(@review.item_id)
		else
			render 'new'
		end
	end

	def destroy

	end

	def show
		@review=Review.find_by_id(params[:id])
		@item=Item.find_by_id(@review.item_id)
	end

	def update
		@review=Review.find(params[:id])
		@review.toggle!(:flag)
		if @review.save
			respond_with(@review) do |format|
				format.html {redirect_to root_url}
				format.js
			end
		end
	end

	def showFlagged
		@reviews=Review.where(flag: true)
	end
end
