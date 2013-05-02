module ReviewsHelper
	def evalExperience(review)
		if review.user.reviews.length>=10
			review.user.update_column(:experienced, true)
		else
			review.user.update_column(:experienced, false)
		end
	end
end
