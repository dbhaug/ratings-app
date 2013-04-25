class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorization_check :only => [:home,:new,:create]
	def home
    if signed_in?
      @categories=current_user.categories
      @categories||=Category.limit(5)
    else
      @categories=Category.limit(5)
    end
	end

	def new
		@user=User.new
	end

	def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Ratings Site"
  		redirect_to @user
    else
  		render 'new'
  	end
  end

  def show
  	@user=User.find_by_id(params[:id])
    @favorites=@user.categories
    @categories=Category.all
  end

  def updateFavorites
    User.find(current_user.id).favorites.each do |favorite|
      favorite.destroy()
    end
    params[:category].each do |category|
      if Favorite.where(category_id: category,
       user_id: current_user.id).exists?
      else
        Favorite.create!(user_id:current_user.id, category_id: category )
      end
    end
    redirect_to current_user
  end

  def index

  end

  def edit
    @user=User.find_by_id(params[:id])
  end

  def update
    @user=User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
end