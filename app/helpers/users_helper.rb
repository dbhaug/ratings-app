module UsersHelper

	def hasInFavorites(category)
		if @favorites.where(id: category.id).empty?
			false
		else
			true
		end
	end

	def noUnratedItems(items)
		items.each do |item|
			if item.average("name").nil?
				return false
			end
		end
		return true
	end
end
