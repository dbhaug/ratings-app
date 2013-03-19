require 'spec_helper'

describe Category do
  	before(:each) do
		@category=Category.create!(title:"comedy")
		@item=Item.create!(name:"movie1", category_id: @category.id)
	end

	it "should exist" do
		Category.find(@item.id).title.should=="comedy"
	end

	it "should have item" do
		Category.find(@category.id).items.first.name=="movie1"
	end
end
