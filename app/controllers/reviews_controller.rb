class ReviewsController < ApplicationController

	def new
		@review = Review.new
	end

	def create
		@review=Review.new(params[:review])
		if @review.save
			redirect_to @review
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
end
