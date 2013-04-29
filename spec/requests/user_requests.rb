require 'spec/helper'

describe "User" do
	subject {page}
	let(:user) {User.create(user_name: 'daniel haugen', 
       	email: 'dan@example.com', 
       	password: 'daniel5', 
       	password_confirmation: 'daniel5' )}

	let (:item) {Item.create(name: Movie)}
	let (:review {Review.create(item_id: :item.id, review: "This is a review")})

	before(:each) do
		sign_in user
		visit root_path
	end
	
	describe "home" do
		it {should have_selector('div.item')}
		it {should have_selector('div.star')}
		
		describe "viewing items" do
			click_link("Movie")
			it {should have_selector('h1',text: "Movie")}
			it {should have_selector('h5',text: review.review)}
		end

		describe "browse items" do
			click_link("Browse")
			it {should have_selector('h1', text: "Items")}
	end

	describe "reviews" do
		it {should have_link('Review', href: new_item_review_path)}
		click_link('Review', href: new_item_review_path)
		fill_in("#new_review", "good")
		click_button('submit')
		it {should have_selector('h5',text: 'good')}

		describe "flag" do
			it {should have_link("Flag", href: review_path(review))}
			click_link("Flag", href: review_path(review))
			it {should_not have_link("Flag", href: review_path)}
		end
	end
end
