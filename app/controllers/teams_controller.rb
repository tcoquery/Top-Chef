class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = current_user.teams.build
  end

  # GET /teams/1/edit
  def edit
    @league = Team.find(params[:id]).league
  end

  # POST /teams or /teams.json
  def create
    @team = current_user.teams.new(name: params[:team][:name], user_id: current_user.id, league_id: params[:team][:league_id])

    respond_to do |format|
      if @team.save
        format.html { redirect_to league_path(params[:team][:league_id]), notice: "Ton équipe a bien été créée." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to leagues_path, notice: "Le nom de ton équipe a bien été modifiée." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
