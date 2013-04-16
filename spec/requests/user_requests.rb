require 'spec/helper'

describe "User" do
	subject {page}
	let(:user) {User.create(user_name: 'daniel haugen', 
       	email: 'dan@example.com', 
       	password: 'daniel5', 
       	password_confirmation: 'daniel5' )}

	let (:item) {Item.create(name: Movie)}

	before(:each) do
		sign_in user
		visit root_path
	end
	
	describe "home" do
		it {should have_selector('div.item')}
		it {should have_selector('div.star')}
	end

	describe "reviews" do
		it {should have_link('Review', href: new_item_review_path)}
		click_link('delete', href: new_item_review_path)
		fill_in("#new_review", "good")
		click_button('submit')
		it {should have_selector('h5',text: 'good')}
	end
end
