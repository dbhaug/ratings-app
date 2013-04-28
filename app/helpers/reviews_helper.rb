module ReviewsHelper
	def evalExperience(review)
		user=review.user

		if user.reviews.length>=5
			user.update_attribute(:experienced, true)
		else
			user.update_attribute(:experienced, false)
		end
	end
end
