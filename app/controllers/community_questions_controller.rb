class CommunityQuestionsController < ApplicationController
  PAGE_SIZE = 15

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_community_question, only: [:show, :edit, :update, :destroy]
  before_action :set_page, only: [:index]

  # GET /community_questions
  def index
    @community_questions_total = CommunityQuestion.search(params[:question_text])
    @community_questions = @community_questions_total.limit(PAGE_SIZE).offset(@page_number * PAGE_SIZE)
  end

  # GET /community_questions/1
  def show
    @community_question.increment!(:view_count)
  end

  # GET /community_questions/new
  def new
    @community_question = CommunityQuestion.new
  end

  # GET /community_questions/1/edit
  def edit
    render :new
  end

  # POST /community_questions
  def create
    @community_question = CommunityQuestion.new(community_question_params)
    @community_question.save
  end

  # PATCH/PUT /community_questions/1
  def update
    @community_question.update(community_question_params)
    render :create
  end

  # DELETE /community_questions/1
  def destroy
    @community_question.destroy
    redirect_to community_questions_url, notice: 'Community question was successfully destroyed.'
  end

  def upvote
    @community_question = CommunityQuestion.find(params[:community_question_id])
    @community_question.increment!(:upvote_count)
    respond_to do |format|
      @question_upvote = 1
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_question
      @community_question = CommunityQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def community_question_params
      params.require(:community_question).permit(:question_text, :brief_details, :upvote_count, :downvote_count ,:user_id,:anonymus, :terms_and_conditions
)
    end

end
