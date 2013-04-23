module UsersHelper

	def hasInFavorites(category)
		if @favorites.where(id: category.id).empty?
			false
		else
			true
		end
	end
end
