class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorization_check :only => [:home,:new,:create]
  respond_to :html, :js
	def home
    if signed_in?
      @categories=current_user.categories
      if @categories.first.nil?
        @categories=Category.limit(5)
      end
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
    @users=User.all
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

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    respond_with(@customer) do |format|
      format.html {redirect_to users_path}
      format.js
    end
  end
end