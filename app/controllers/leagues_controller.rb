class LeaguesController < ApplicationController
  before_action :set_league, only: %i[ show edit update destroy ]

  # GET /leagues or /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1 or /leagues/1.json
  def show
    @leagues = current_user.leagues.all

    @league_name = League.where('id = ?', params[:id]).pluck(:name).first

    @league_member = current_user.leagues.where('league_id = ?', params[:id]).first

    @team = current_user.teams.where('league_id = ?', params[:id])
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues or /leagues.json
  def create
    @league = League.new(league_params)

    respond_to do |format|
      if @league.save
        LeaguesUsers.create(league_id: @league.id, user_id: current_user.id)
        format.html { redirect_to root_path, notice: "Ta ligue a bien été créée." }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1 or /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to league_url(@league), notice: "Ta ligue a bien été modifiée." }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1 or /leagues/1.json
  def destroy
    @league.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Ta ligue a bien été supprimée
      ." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def league_params
      params.require(:league).permit(:name, :admin_id)
    end
end
