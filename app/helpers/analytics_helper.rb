module AnalyticsHelper
	def like
		if current_user.present? 
	    liked= AnalyticCommunityQuestion.where(type_id: @community_question.id, user_id: current_user.id, vote_count: true) 
	  else
	    liked= AnalyticCommunityQuestion.where(type_id: @community_question.id, ip_address: request.remote_ip, vote_count: true) 
	  end 
  end
end
