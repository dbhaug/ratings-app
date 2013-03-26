class UsersController < ApplicationController

	def home

	end

	def new
		@user=User.new
	end

	def create
  	@user = User.new(params[:user])
  	if @user.save
      	flash[:success] = "Welcome to the Ratings Site"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  	def show
  		
  	end

  	def index

  	end
end
