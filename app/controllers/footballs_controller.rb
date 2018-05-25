class FootballsController < ApplicationController
  before_action :set_football, only: [:show, :edit, :update, :destroy]

  # GET /footballs
  # GET /footballs.json
  def index
    @footballs = Football.all
  end

  # GET /footballs/1
  # GET /footballs/1.json
  def show
    analytic_record = [view_count: true ,ip_address: request.remote_ip, record_id: @football.id]
    AnalyticFootball.create(analytic_record)
  end

  # GET /footballs/new
  def new
    @football = Football.new
  end

  # GET /footballs/1/edit
  def edit
  end

  # POST /footballs
  # POST /footballs.json
  def create
    @football = Football.new(football_params)

    respond_to do |format|
      if @football.save
        format.html { redirect_to @football, notice: 'Football was successfully created.' }
        format.json { render :show, status: :created, location: @football }
      else
        format.html { render :new }
        format.json { render json: @football.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footballs/1
  # PATCH/PUT /footballs/1.json
  def update
    respond_to do |format|
      if @football.update(football_params)
        format.html { redirect_to @football, notice: 'Football was successfully updated.' }
        format.json { render :show, status: :ok, location: @football }
      else
        format.html { render :edit }
        format.json { render json: @football.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footballs/1
  # DELETE /footballs/1.json
  def destroy
    @football.destroy
    respond_to do |format|
      format.html { redirect_to footballs_url, notice: 'Football was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    @football= Football.find(params[:football_id])
    #@community_question.increment!(:vote_count)
    @liked = AnalyticFootball.where(record_id: @football.id, vote_count: true).count(:vote_count)
    AnalyticFootball.update(vote_count: true)
    
    respond_to do |format|
      @question_upvote = 1
      format.html
      format.js  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_football
      @football = Football.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def football_params
      params.require(:football).permit(:team, :palyer)
    end
end
