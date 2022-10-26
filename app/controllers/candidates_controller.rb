class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all

    @leagues_teams = Team.where('league_id = ?', params[:league])
  end

end
