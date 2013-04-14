require 'spec_helper'

describe Review do
	before(:each) do
		@user=User.create!(user_name:"joe", 
		 			email: "joe@example.com", 
		 			password: "joejoe", 
		 			password_confirmation: "joejoe")
		@item=Item.create!(name: "Movie1")
		@review=Review.create!(user_id: @user.id, item_id: @item.id, rating: 5)
	end

	it 'should exist' do
		Review.find(@review.id).rating==5
	end

	it "should belong to @user and @item" do
		Review.find(@review.id).user.user_name.should=="joe"
		Review.find(@review.id).item.name.should=="Movie1"
	end
end