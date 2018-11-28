module AnalyticsHelper
<<<<<<< HEAD
=======
	def like
		if current_user.present? 
	    liked= AnalyticCommunityQuestion.where(type_id: @community_question.id, user_id: current_user.id, vote_count: true) 
	  else
	    liked= AnalyticCommunityQuestion.where(type_id: @community_question.id, ip_address: request.remote_ip, vote_count: true) 
	  end 
  end
>>>>>>> 967eb6bf2ecfd5b1ec932c74e24ca2d87334443d
end
