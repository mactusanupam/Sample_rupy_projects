class CommunityAnswersController < ApplicationController

  def all_comments
    ca = CommunityAnswer.find params[:id]
    @comments = ca.comments
    render template: 'community_questions/all_comments'
  end

  def create
    @community_question = CommunityQuestion.find(params[:community_question_id])
    params[:community_answer][:user_id] = current_user.id
    @community_answer = @community_question.community_answers.build(community_answer_params)

    @community_answer.save
    render template: 'community_questions/answer_create.js.erb'
  end

  def upvote
    @community_answer = CommunityAnswer.find(params[:community_answer_id])
    @community_answer.increment!(:upvote_count)
    @answer_upvote = 1
    render :template => 'community_questions/upvote.js.erb'
  end

  def downvote
    CommunityAnswer.decrement_counter(:upvote_count, params[:community_answer_id])
  end

  private
    def community_answer_params
      params.require(:community_answer).permit(:name, :answer_text ,:upvote_count, :community_question ,:user_id, :parent_id, :anonymus)
    end
end
