require 'spec_helper'

describe User do
	before(:each) do
		@user=User.create!(name: "Bob")
		@item=Item.create!(name: "Movie1")
	end
	
	it 'should exist' do
		User.find(@user.id).name.should=="Bob"
	end

	it 'should have 2 reviews' do
		Review.create!(user_id: @user.id, item_id: @item.id)
		Review.create!(user_id: @user.id, item_id: @item.id)
		@user.reviews(force_reload: true).size.should==2
	end

	it 'should delete reviews when user is deleted' do
		r1= Review.create!(user_id: @user.id, item_id: @item.id)
		r2= Review.create!(user_id: @user.id, item_id: @item.id)
		@user.delete
		r1.user(force_reload: true)==nil
		r2.user(force_reload: true)==nil
		r1.nil?
		r1.nil?
	end
end