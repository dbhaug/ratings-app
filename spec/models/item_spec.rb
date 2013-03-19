require 'spec_helper'

describe Item do 
	before(:each) do
		@item=Item.create!(name:"movie1")
		@user=User.create!(name:"joe")
	end

	it "should exist" do
		Item.find(@item.id).name.should=="movie1"
	end

	it "should have reviews" do
		Review.create!(user_id: @user.id, item_id: @item.id)
		Review.create!(user_id: @user.id, item_id: @item.id)
		@item.reviews.size==2
	end

	it 'should delete reviews when item is deleted' do
		r1= Review.create!(user_id: @user.id, item_id: @item.id)
		r2= Review.create!(user_id: @user.id, item_id: @item.id)
		@item.delete
		r1.user(force_reload: true)==nil
		r2.user(force_reload: true)==nil
		r1.nil?
		r1.nil?
	end
end