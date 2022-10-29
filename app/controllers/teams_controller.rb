class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  TeamMatchesWrapper = Struct.new(:name, :id, :rank, :points, :games, :wins, :draws, :losses, :goal_difference)

  # GET /teams or /teams.json
  def index
    @current_user = session['userinfo']
    @teams = Team.all
    @matches = Match.where.not(:home_team_score => nil)
    
    @team_wrappers_list = []
    @teams.each do |team|
      home_matches = @matches.select { |match| match.home_team_id == team.id }
      away_matches = @matches.select { |match| match.away_team_id == team.id }
      points = 0
      wins = 0
      draws = 0
      losses = 0
      goal_difference = 0

      home_matches.each do |match|
        goal_difference += match.home_team_score - match.away_team_score
        if match.home_team_score > match.away_team_score
          wins += 1
          points += 3
        elsif match.home_team_score < match.away_team_score
          losses += 1
        else
          draws += 1
          points += 1
        end
      end

      away_matches.each do |match|
        goal_difference += match.away_team_score - match.home_team_score
        if match.away_team_score > match.home_team_score
         wins += 1
         points += 3
        elsif match.away_team_score < match.home_team_score
         losses += 1
        else
         draws += 1
         points += 1
        end
       end

       games = wins + draws + losses
       team_wrapper = TeamMatchesWrapper.new(team.name, team.id, 0, points, games, wins, draws, losses, goal_difference)
       @team_wrappers_list.push(team_wrapper)
    end
    
    @team_wrappers_list.sort_by! { |wrapper| [wrapper.points, wrapper.goal_difference] }.reverse!
  end

  # GET /teams/1 or /teams/1.json
  def show
    redirect_to root_path
  end

  # GET /teams/new
  def new
    redirect_to root_path
    # @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    redirect_to root_path
  end

  # POST /teams or /teams.json
  def create
    redirect_to root_path
    # @team = Team.new(team_params)

    # respond_to do |format|
    #   if @team.save
    #     format.html { redirect_to team_url(@team), notice: "Team was successfully created." }
    #     format.json { render :show, status: :created, location: @team }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @team.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    redirect_to root_path
    # respond_to do |format|
    #   if @team.update(team_params)
    #     format.html { redirect_to team_url(@team), notice: "Team was successfully updated." }
    #     format.json { render :show, status: :ok, location: @team }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @team.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    redirect_to root_path
    # @team.destroy

    # respond_to do |format|
    #   format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name)
    end
end
