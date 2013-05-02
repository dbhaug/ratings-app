module ReviewsHelper
	def evalExperience(review)
		count=0
		review.user.reviews.each do |temp|
			if(!temp.flag)
				count=count+1
			end
		end
		if count>=10
			review.user.update_column(:experienced, true)
		else
			review.user.update_column(:experienced, false)
		end
	end
end
