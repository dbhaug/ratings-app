class CategoriesController < ApplicationController
	def new
		@category=Category.new
	end

	def create
		@category=Category.new(params[:category])
		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end

	def show
		@category=Category.find_by_id(params[:id])
	end

	def index
		@categories=Category.all
	end
end
