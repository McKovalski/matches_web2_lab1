class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]
  before_action :authorize, only: [:new, :edit, :update, :destroy]

  MatchTeamsWrapper = Struct.new(:match, :home_team_name, :away_team_name)

  # GET /matches or /matches.json
  def index
    @current_user = session['userinfo']
    matches = Match.all
    played_matches = Match.where.not(:home_team_score => nil)
    upcoming_matches = Match.where(:home_team_score => nil)
    @played_matches_wrappers = []
    @upcoming_matches_wrappers = []

    played_matches.sort_by { |match| match.time_of_play }.reverse.each do |match|
      home_team = Team.find(match.home_team_id)
      away_team = Team.find(match.away_team_id)
      wrapper = MatchTeamsWrapper.new(match, home_team.name, away_team.name)
      @played_matches_wrappers.push(wrapper)
    end

    upcoming_matches.sort_by { |match| match.time_of_play }.each do |match|
      home_team = Team.find(match.home_team_id)
      away_team = Team.find(match.away_team_id)
      wrapper = MatchTeamsWrapper.new(match, home_team.name, away_team.name)
      @upcoming_matches_wrappers.push(wrapper)
    end
  end

  # GET /matches/1 or /matches/1.json
  def show
    @current_user = session['userinfo']
    @comments = Comment.order('updated_at DESC').where(:match_id => @match)
    @home_team = Team.find(@match.home_team_id)
    @away_team = Team.find(@match.away_team_id)
  end

  # GET /matches/new
  def new
    @current_user = session['userinfo']
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
    @current_user = session['userinfo']
  end

  # POST /matches or /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to match_url(@match), notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:time_of_play, :home_team_score, :away_team_score, :home_team_id, :away_team_id)
    end

    # Only allow admins to add, delete and change matches
    def authorize
      current_user = session['userinfo']
      unless current_user["name"] == "velara8158@cadolls.com"
        flash[:error] = "Unauthorized access."
        redirect_to root_path
      end
    end
end
